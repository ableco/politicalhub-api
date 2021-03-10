class CandidatePoliticalPartyOfficeEntrySerializer < ActiveModel::Serializer
  attributes :political_organization, :political_organization_id, :office, :start_year, :end_year

  def political_organization
    object.political_organization_name
  end
end
