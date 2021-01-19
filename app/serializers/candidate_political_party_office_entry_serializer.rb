class CandidatePoliticalPartyOfficeEntrySerializer < ActiveModel::Serializer
  attributes :political_organization, :office, :start_year, :end_year

  def political_organization
    object.political_organization_name
  end
end
