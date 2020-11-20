require "cuba"

Cuba.define do
  on get do
    on "organizaciones-politicas" do
      res.write File.read("./data/organizaciones-politicas.json")
    end

    on "congresistas/:identifier" do |identifier|
      res.write File.read("./data/congresistas-2020/#{identifier}.json")
    end

    on "congresistas" do
      res.write File.read("./data/congresistas-2020.json")
    end
  end
end
