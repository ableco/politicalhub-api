class ElectoralHistoryEntrySerializer < ActiveModel::Serializer
  attributes :political_organization, :office, :elected

  def political_organization
    object.political_organization_name
  end
end
