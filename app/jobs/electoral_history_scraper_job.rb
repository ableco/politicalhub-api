class ElectoralHistoryScraperJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: 2

  def perform(identification_number)
    Scrapers::ElectoralHistoryScraper.call(identification_number)
  end
end
