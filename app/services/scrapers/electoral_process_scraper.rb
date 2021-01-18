class Scrapers::ElectoralProcessScraper
  class << self
    def call
      url = "https://plataformaelectoral.jne.gob.pe/Resoluciones/GetListProcesosCR"
      request = HTTP.follow.get(url)

      JSON.parse(request.body.to_s).fetch("data").each do |process|
        ElectoralProcess.find_or_create_by(slug: process["strProcesoElectoral"].parameterize) do |electoral_process|
          electoral_process.assign_attributes(
            name: process["strProcesoElectoral"],
            started_at: parse_date(electoral_process["strFechaAperturaProceso"]),
            jne_id: process["idProcesoElectoral"]
          )
        end
      end
    end

    private

    def parse_date(date)
      return nil if date.blank?

      Date.strptime(date, "%d/%m/%Y")
    end
  end
end
