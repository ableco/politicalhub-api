class ElectoralHistoryEntrySerializer < ActiveModel::Serializer
  attributes :political_organization, :political_organization_id, :office, :elected, :electoral_process_started_at

  def political_organization
    object.political_organization_name
  end

  def electoral_process_started_at
    object.electoral_process&.started_at
  end
end
