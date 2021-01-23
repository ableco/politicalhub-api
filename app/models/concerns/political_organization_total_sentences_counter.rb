module PoliticalOrganizationTotalSentencesCounter
  extend ActiveSupport::Concern

  included do
    after_save :update_political_organization_totals
  end

  def update_political_organization_totals
    candidates = Candidate.where(electoral_process_id: candidate.electoral_process_id, political_organization_id: candidate.political_organization_id)

    candidates_with_sentences = candidates.where(id: CandidateCriminalConvictionEntry.select(:candidate_id)).or(candidates.where(id: CandidateCivilJudgementEntry.select(:candidate_id)))

    total_candidates_with_sentences = candidates_with_sentences.count
    total_sentences = CandidateCriminalConvictionEntry.where(candidate_id: candidates_with_sentences).count + CandidateCivilJudgementEntry.where(candidate_id: candidates_with_sentences).count

    political_organization_stat = PoliticalOrganizationStat.find_or_create_by(
      political_organization_id: candidate.political_organization_id,
      electoral_process_id: candidate.electoral_process_id
    )
    political_organization_stat.update(total_candidates_with_sentences: total_candidates_with_sentences, total_sentences: total_sentences)
  end
end
