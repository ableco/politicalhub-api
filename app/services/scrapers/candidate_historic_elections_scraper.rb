class Scrapers::CandidateHistoricElectionsScraper
  class << self
    def call(identification_number)
      request = HTTP.headers({
        "accept": "application/json, text/javascript, */*; q=0.01",
        "accept-language": "es-PE,es-419;q=0.9,es;q=0.8,en;q=0.7",
        "cache-control": "no-cache",
        "content-type": "application/json; charset=UTF-8",
        "pragma": "no-cache",
        "sec-fetch-dest": "empty",
        "sec-fetch-mode": "cors",
        "sec-fetch-site": "same-origin",
        "x-requested-with": "XMLHttpRequest"
      }).post(
        "https://infogob.jne.gob.pe/Politico/ListarPolitico",
        json: {
          "IdDNI": identification_number,
          "TxApePat": "",
          "TxApeMat": "",
          "TxNombre":"",
          "token": "1uOrPCXZS4o=OC"
        }
      )

      person = JSON.parse(request.body.to_s).fetch("Data").first

      return nil if person.nil?

      parameter = person["TxRutaPolitico"].split("_").last

      # detail_request = HTTP.headers({
      #   "accept": "text/html, */*; q=0.01",
      #   "accept-language": "es-PE,es-419;q=0.9,es;q=0.8,en;q=0.7",
      #   "cache-control": "no-cache",
      #   "content-type": "application/json; charset=UTF-8",
      #   "pragma": "no-cache",
      #   "sec-fetch-dest": "empty",
      #   "sec-fetch-mode": "cors",
      #   "sec-fetch-site": "same-origin",
      #   "x-requested-with": "XMLHttpRequest"
      # }).post(
      #   "https://infogob.jne.gob.pe/Politico/_HistorialFichaPolitico?istrParameters=#{parameter}",
      #   json: {
      #     "token": "1uOrPCXZS4o=OC"
      #   }
      # )

      previous_elections_request = HTTP.headers({
        "accept": "text/html, */*; q=0.01",
        "accept-language": "es-PE,es-419;q=0.9,es;q=0.8,en;q=0.7",
        "cache-control": "no-cache",
        "content-type": "application/json; charset=UTF-8",
        "pragma": "no-cache",
        "sec-fetch-dest": "empty",
        "sec-fetch-mode": "cors",
        "sec-fetch-site": "same-origin",
        "x-requested-with": "XMLHttpRequest"
      }).post(
        "https://infogob.jne.gob.pe/Politico/_ProcesosFichaPolitico?istrParameters=#{parameter}",
        json: {
          "token": "1uOrPCXZS4o=OC"
        }
      )

      document = Nokogiri::HTML(previous_elections_request.body.to_s)

      previous_elections = document.css("#gridPoliticoProcesosElectorales > tbody > tr").map do |row|
        {
          electoral_process: row.css("td")[0].text,
          office: row.css("td")[1].text,
          political_organization: row.css("td")[2].text,
          elected: row.css("td")[4].text === "SI",
        }
      end

    end
  end
end