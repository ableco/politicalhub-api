class PoliticalOrganizationsController < ApplicationController
  def index
    political_organizations, meta = Rails.cache.fetch(params.to_unsafe_h) do
      electoral_process = ElectoralProcess.find_by(jne_id: params[:electoral_process] || ElectoralProcess::LAST_ELECTION_ID)
      political_organizations = PoliticalOrganization.joins(:political_organization_stat)
                                  .where("political_organization_stats.total_candidates > 0")

      [political_organizations.to_a, averages_dict(political_organizations)]
    end
    render json: political_organizations, meta: meta
  end

  def show
    political_organization = Rails.cache.fetch(params.to_unsafe_h) do
      PoliticalOrganization.find_by(slug: params[:id])
    end

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
