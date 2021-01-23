class Scrapers::ElectoralHistoryScraper
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
          "TxNombre": "",
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

      person = Person.find_by(identification_number: identification_number)

      document = Nokogiri::HTML(previous_elections_request.body.to_s)

      document.css("#gridPoliticoProcesosElectorales > tbody > tr").each do |row|
        electoral_process_name = row.css("td")[0].text
        office_name = row.css("td")[1].text
        political_organization_name = row.css("td")[2].text

        electoral_process = ElectoralProcess.find_or_create_by(slug: electoral_process_name.parameterize)
        electoral_process.update(name: electoral_process_name)

        political_organization = PoliticalOrganization.find_by(name: political_organization_name)

        previous_election_entry = {
          office: office_name,
          office_id: Candidate::ELECTION_OFFICES.find { |_, v| v == office_name }&.first,
          political_organization_name: political_organization_name,
          political_organization_id: political_organization&.id,
          elected: row.css("td")[4].text === "SI"
        }

        electoral_history_entry = ElectoralHistoryEntry.find_or_create_by(
          person_id: person.id,
          electoral_process_id: electoral_process.id
        )

        electoral_history_entry.update(previous_election_entry)
      end

    end
  end
end
