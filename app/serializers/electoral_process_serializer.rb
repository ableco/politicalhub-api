class ElectoralProcessSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :started_at
end
