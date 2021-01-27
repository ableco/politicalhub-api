class PoliticalOrganizationsController < ApplicationController
  def index
    electoral_process = ElectoralProcess.find_by(jne_id: params[:electoral_process] || ElectoralProcess::LAST_ELECTION_ID)
    political_organizations = PoliticalOrganization.joins(:political_organization_stat)
                                .where("political_organization_stats.total_candidates > 0")

    render json: political_organizations, meta: averages_dict(political_organizations)
  end

  def show
    political_organization = PoliticalOrganization.find_by(slug: params[:id])

    render json: political_organization
  end

  def averages_dict(collection)
    {
      average_candidates: collection.sum("political_organization_stats.total_candidates") / collection.count,
      average_designated: collection.sum("political_organization_stats.total_designated") / collection.count,
      average_candidates_with_sentences: collection.sum("political_organization_stats.total_candidates_with_sentences") / collection.count,
      average_sentences: collection.sum("political_organization_stats.total_sentences") / collection.count
    }
  end
end
