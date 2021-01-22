class TaxDebtsScraperJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: 2

  def perform(identification_number)
    Scrapers::TaxDebtsScraper.call(identification_number)
  end
end
