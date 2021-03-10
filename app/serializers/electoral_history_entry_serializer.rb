class ElectoralHistoryEntrySerializer < ActiveModel::Serializer
  attributes :political_organization, :political_organization_id, :office, :elected, :electoral_process

  def political_organization
    object.political_organization_name
  end

  def electoral_process
    object.electoral_process&.name
  end
end
