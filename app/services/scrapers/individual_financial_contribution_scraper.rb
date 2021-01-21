class Scrapers::IndividualFinancialContributionScraper
  class << self
    def call(identification_number)
      request = HTTP.headers({
        "accept": "*/*",
        "accept-language": "es-PE,es-419;q=0.9,es;q=0.8,en;q=0.7",
        "cache-control": "no-cache",
        "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
        "pragma": "no-cache",
        "sec-fetch-dest": "empty",
        "sec-fetch-mode": "cors",
        "sec-fetch-site": "same-origin",
        "x-requested-with": "XMLHttpRequest"
      }).post(
        "https://www.web.onpe.gob.pe/loadDetail/",
        form: {
          txtID: "resultado-persona",
          txtCC: "1",
          txtND: identification_number
        }
      )

      document = Nokogiri::HTML(request.body.to_s)

      rows = document.css("table").first&.css("tbody > tr")

      return nil if rows.nil?

      contributions = rows.slice(0, rows.length - 1).map do |row|
        period, amount_money, amount_others, amount_total = row.css("td").map(&:text)

        {
          period: period,
          amount_money: amount_money.tr(",", "").to_d,
          amount_others: amount_others.tr(",", "").to_d,
          amount_total: amount_total.tr(",", "").to_d
        }
      end

      person = Person.find_by(identification_number: identification_number)

      return contributions if person.nil?

      contributions.each do |contribution|
        individual_financial_contribution = IndividualFinancialContribution.find_or_create_by(
          person_id: person.id,
          period: contribution[:period]
        )

        individual_financial_contribution.update(contribution)
      end
    end
  end
end
