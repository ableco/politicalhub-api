class Scrapers::TaxDebtsScraper
  class << self
    def call(identification_number)
      browser = create_browser
      browser.goto "https://e-consultaruc.sunat.gob.pe/cl-ti-itmrconsruc/FrameCriterioBusquedaWeb.jsp"
      browser.button(id: "btnPorDocumento").click
      browser.text_field(id: "txtNumeroDocumento").set(identification_number)
      browser.button(id: "btnAceptar").click
      browser.link(css: ".aRucs").click
      browser.button(css: ".btnInfDeuCoa").click

      table = browser.element(css: ".table")

      if table.exists?
        table = table.to_subtype

        tax_debts = table.tbody.rows.map do |row|
          {
            amount: row.cells[0].text.to_d,
            period: row.cells[1].text
          }
        end

        person = Person.find_by(identification_number: identification_number)

        return tax_debts if person.nil?

        tax_debts.each do |debt|
          tax_debt = TaxDebt.find_or_create_by(
            person_id: person.id,
            period: debt[:period]
          )

          tax_debt.update(debt)
        end

        browser.close
        browser = nil
      end
    rescue StandardError => error
      puts error

      browser.close
      browser = nil

      nil
    end

    private

    def create_browser
      options = Selenium::WebDriver::Chrome::Options.new

      options.add_argument "--headless"
      options.add_argument "--window-size=800x600"
      options.add_argument "--hide-scrollbars"
      options.add_argument "--disable-gpu"
      options.add_argument "--no-sandbox"

      if chrome_bin = ENV["GOOGLE_CHROME_SHIM"]
        options.add_argument "--disable-dev-shm-usage"
        options.binary = chrome_bin
      end

      browser = Watir::Browser.new(:chrome, options: options)
      browser.driver.manage.timeouts.page_load = 120

      browser
    end
  end
end
