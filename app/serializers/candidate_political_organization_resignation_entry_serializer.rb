class CandidatePoliticalOrganizationResignationEntrySerializer < ActiveModel::Serializer
  attributes :political_organization, :resignation_year

  def political_organization
    object.political_organization_name
  end
end
