class CandidatesController < ApplicationController
  def index
    electoral_process = ElectoralProcess.find_by(jne_id: params[:electoral_process] || ElectoralProcess::LAST_ELECTION_ID)
    political_organization = params[:political_organization]
    ubigeo = params[:ubigeo]
    office = params[:office]
    with_sentences = params[:with_sentences].to_s == "true"
    has_individual_financial_contributions = params[:has_individual_financial_contributions].to_s == "true"
    properties_value = params[:properties_value]
    properties_value_greater_than = params[:properties_value_greater_than]

    candidates = Candidate.includes(
      {person: :individual_financial_contributions },
      :electoral_process,
      :political_organization,
      :candidate_education_entries,
      :candidate_university_education_entries,
      :candidate_graduate_education_entries,
      :candidate_work_experience_entries,
      :candidate_political_party_office_entries,
      :candidate_previous_elected_office_entries,
      :candidate_political_organization_resignation_entries,
      :candidate_criminal_conviction_entries,
      :candidate_civil_judgement_entries,
      :candidate_income_entries,
      :candidate_property_entries
    )
    candidates = candidates.where(electoral_process_id: electoral_process.id)
    candidates = candidates.where(political_organization_id: political_organization) if political_organization.present?
    candidates = candidates.where(postulation_ubigeo: ubigeo) if ubigeo.present?
    candidates = candidates.where(office_id: office).or(candidates.where(secondary_office_id: office)) if office.present?

    if with_sentences
      candidates = candidates.where(id: CandidateCriminalConvictionEntry.select(:candidate_id)).or(candidates.where(id: CandidateCivilJudgementEntry.select(:candidate_id)))
    end

    if has_individual_financial_contributions
      candidates = candidates.where(people: { id: IndividualFinancialContribution.select(:person_id) })
    end

    candidates = candidates.where("total_properties_value = ?", properties_value) if properties_value.present?
    candidates = candidates.where("total_properties_value > ?", properties_value_greater_than) if properties_value_greater_than.present?

    render json: candidates
  end
end
