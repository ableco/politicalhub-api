class Candidate < ApplicationRecord
  ELECTION_OFFICES = {
    1 => "PRESIDENTE DE LA REPÚBLICA",
    2 => "PRIMER VICEPRESIDENTE DE LA REPÚBLICA",
    3 => "SEGUNDO VICEPRESIDENTE DE LA REPÚBLICA",
    4 => "CONGRESISTA DE LA REPÚBLICA",
    5 => "REPRESENTANTE ANTE EL PARLAMENTO ANDINO",
    6 => "GOBERNADOR REGIONAL",
    7 => "VICEGOBERNADOR REGIONAL",
    8 => "ALCALDE PROVINCIAL",
    9 => "REGIDOR PROVINCIAL",
    10 => "ALCALDE DISTRITAL",
    11 => "REGIDOR DISTRITAL",
    12 => "CONSEJERO REGIONAL",
    13 => "ACCESITARIO",
    14 => "REGIDOR DE CENTRO POBLADO",
    15 => "DIPUTADO",
    16 => "SENADOR",
    17 => "ALCADE(SA) DE CENTRO POBLADO",
    18 => "CONGRESISTA CONSTITUYENTE",
    19 => "REGIDOR PROVINCIAL SUPLENTE",
    20 => "REPRESENTANTE DE ASAMBLEA REGIONAL",
    21 => "REGIDOR DISTRITAL SUPLENTE"
  }

  belongs_to :person
  belongs_to :electoral_process
  belongs_to :political_organization
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

  def office
    return nil if office_id.nil?

    ELECTION_OFFICES[office_id]
  end

  def secondary_office
    return nil if secondary_office_id.nil?

    ELECTION_OFFICES[secondary_office_id]
  end
end
