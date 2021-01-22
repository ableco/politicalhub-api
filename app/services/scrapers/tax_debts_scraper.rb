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
      if table = browser.table(css: ".table")
        debts = table.tbody.rows.map do |row|
          {
            amount: row.cells[0].text.to_d,
            period: row.cells[1].text,
          }
        end

        browser.close

        debts
      end
    rescue StandardError => error
      puts error
      browser.close

      nil
    end

    private

    def create_browser
      options = Selenium::WebDriver::Chrome::Options.new

      options.add_argument "--headless"
      options.add_argument "--window-size=800x600"
      options.add_argument "--hide-scrollbars"

      if chrome_bin = ENV["GOOGLE_CHROME_SHIM"]
        options.add_argument "--no-sandbox"
        options.add_argument "--disable-dev-shm-usage"
        options.binary = chrome_bin
      end

      browser = Watir::Browser.new(:chrome, options: options)
      browser.driver.manage.timeouts.page_load = 120

      browser
    end
  end
end
