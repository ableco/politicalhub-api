require "scrap_kit"
require "json"

recipe = ScrapKit::Recipe.load(
  url: "https://aplicaciones007.jne.gob.pe/srop_publico/Consulta/OrganizacionPolitica",
  steps: [
    {
      fill_form: {
        "#IDESTADOOP": "Inscrito"
      }
    },
    {
      click: {
        css: ".col-sm-3 input[type=button]"
      }
    }
  ],
  attributes: {
    organizaciones: {
      selector: "#tblOrganizacionPolitica > tbody > tr",
      children_attributes: {
        logo: "td:nth-child(2) > div > img",
        nombre: "td:nth-child(2) > span:nth-child(2)",
        fecha_inscripcion: "td:nth-child(2) > span:nth-child(4)",
        website: "td:nth-child(3) > address > div:nth-child(3) > div.col-md-11",
      }
    }
  }
)

output = recipe.run

# Prepare the table in ASCII format

output[:organizaciones] = output[:organizaciones].map do |item|
  item[:fecha_inscripcion] = item[:fecha_inscripcion].split(" ").last
  item
end

file = File.open("./data/organizaciones-politicas.json", "w")
file.write(output[:organizaciones].to_json)
