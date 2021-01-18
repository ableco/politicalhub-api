class CandidateScraperJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: 2

  def perform(electoral_process_id = 110, election_type_id = 2, ubigeo = "")
    Scrapers::CandidateScraper.call(electoral_process_id: electoral_process_id, election_type_id: election_type_id, ubigeo: ubigeo)
  end
end
