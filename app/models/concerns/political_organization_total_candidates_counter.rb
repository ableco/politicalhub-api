module PoliticalOrganizationTotalCandidatesCounter
  extend ActiveSupport::Concern

  included do
    after_save :update_political_organization_totals
  end

  def update_political_organization_totals
    candidates = Candidate.where(electoral_process_id: electoral_process_id, political_organization_id: political_organization_id)

    total_candidates = candidates.count
    total_designated = candidates.where(designated: true).count
    total_m = Person.where(candidate_id: candidates.select(:id), gender: "m").count
    total_f = Person.where(candidate_id: candidates.select(:id), gender: "f").count

    political_organization_stat = PoliticalOrganizationStat.find_or_create_by(
      political_organization_id: political_organization_id,
      electoral_process_id: electoral_process_id
    )
    political_organization_stat.update(
      total_candidates: total_candidates,
      total_designated: total_designated,
      total_m: total_m,
      total_f: total_f
    )
  end
end
