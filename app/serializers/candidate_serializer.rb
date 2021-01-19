class CandidateSerializer < ActiveModel::Serializer
  attributes :id, :names, :family_name, :mothers_maiden_name, :date_of_birth, :profile_photo_url
  attributes :residence_ubigeo, :political_organization_id, :postulation_ubigeo, :office, :secondary_office

  # belongs_to :electoral_process
  # belongs_to :political_organization
  has_many :candidate_education_entries
  has_many :candidate_university_education_entries
  has_many :candidate_graduate_education_entries
  has_many :candidate_work_experience_entries
  has_many :candidate_political_party_office_entries
  has_many :candidate_previous_elected_office_entries
  has_many :candidate_political_organization_resignation_entries
  has_many :candidate_criminal_conviction_entries
  has_many :candidate_civil_judgement_entries
  has_many :candidate_income_entries
  has_many :candidate_property_entries

  def names
    object.person.names
  end

  def family_name
    object.person.family_name
  end

  def mothers_maiden_name
    object.person.mothers_maiden_name
  end

  def date_of_birth
    object.person.date_of_birth
  end

  def profile_photo_url
    return nil if object.person.profile_photo.blank?

    File.join("https://declara.jne.gob.pe/", object.person.profile_photo)
  end
end
