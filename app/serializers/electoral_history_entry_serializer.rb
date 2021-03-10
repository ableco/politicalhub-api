class ElectoralHistoryEntrySerializer < ActiveModel::Serializer
  attributes :political_organization, :political_organization_id, :office, :elected

  def political_organization
    object.political_organization_name
  end
end
