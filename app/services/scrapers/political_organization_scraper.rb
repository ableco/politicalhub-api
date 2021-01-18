class Scrapers::PoliticalOrganizationScraper
  class << self
    def call(state = "1")
      url = "https://aplicaciones007.jne.gob.pe/srop_publico/Consulta/OrganizacionPolitica/OrganizacionPoliticaLista"
      request = HTTP.headers({
        "accept": "*/*",
        "accept-language": "es-PE,es-419;q=0.9,es;q=0.8,en;q=0.7",
        "cache-control": "no-cache",
        "content-type": "application/json; charset=UTF-8",
        "pragma": "no-cache",
        "requestverificationtoken": "YsH89eZAIRWX3PMWCVNASmFs5W5dNEw6i5rHnu2IJcRCcO9ngSZvsaO93_xbsjaANthbeXa6ZM0UCKpxBNq7HvBzVbgAks5wypeV4uUFauc1:kwpT9HiBZ7uzv80o4b2mpMmIJtCXnJMDtOGufTV6VvEbM9keo8aAGKZP2IvHDP4QtkaPlDvVzrrPGJijO0WYd59b5d1024YtvJTRCtxxO5Q1",
        "sec-fetch-dest": "empty",
        "sec-fetch-mode": "cors",
        "sec-fetch-site": "same-origin",
        "x-requested-with": "XMLHttpRequest"
      }).post(
        url,
        json: {
          CODTIPOOP: "01",
          IDESTADOOP: state
        }
      )

      document = Nokogiri::HTML(request.body.to_s)
      organizations = document.css("#tblOrganizacionPolitica > tbody > tr").map do |organization|
        {
          logo: "https://aplicaciones007.jne.gob.pe/#{organization.css('td:nth-child(2) > div > img').first&.attr('src')}",
          name: organization.css("td:nth-child(2) > span:nth-child(2)").first&.text,
          enrolled_at: organization.css("td:nth-child(2) > span:nth-child(4)").first&.text,
          website: organization.css("td:nth-child(3) > address > div:nth-child(3) > div.col-md-11").first&.text
        }
      end

      organizations.each do |organization|
        organization[:enrolled_at] = Date.strptime(organization[:enrolled_at].split(" ").last, "%d/%m/%Y") if organization[:enrolled_at]
        organization[:organization_type] = "political_party"

        PoliticalOrganization.find_or_create_by(slug: organization[:name].parameterize) do |political_organization|
          political_organization.assign_attributes(organization)
        end
      end
    end
  end
end
