class Scrapers::PoliticalOrganizationScraper
  class << self
    def call(state = "Inscrito")
      recipe = ScrapKit::Recipe.load(
        url: "https://aplicaciones007.jne.gob.pe/srop_publico/Consulta/OrganizacionPolitica",
        steps: [
          {
            fill_form: {
              "#IDESTADOOP": state
            }
          },
          {
            click: {
              css: ".col-sm-3 input[type=button]"
            }
          }
        ],
        attributes: {
          organizations: {
            selector: "#tblOrganizacionPolitica > tbody > tr",
            children_attributes: {
              logo: "td:nth-child(2) > div > img",
              name: "td:nth-child(2) > span:nth-child(2)",
              enrolled_at: "td:nth-child(2) > span:nth-child(4)",
              website: "td:nth-child(3) > address > div:nth-child(3) > div.col-md-11",
            }
          }
        }
      )

      output = recipe.run

      output[:organizations].each do |organization|
        organization[:enrolled_at] = Date.strptime(organization[:enrolled_at].split(" ").last, "%d/%m/%Y") if organization[:enrolled_at]
        organization[:organization_type] = "political_party"

        PoliticalOrganization.find_or_create_by(slug: organization[:name].parameterize) do |political_organization|
          political_organization.assign_attributes(organization)
        end
      end
    end
  end
end
