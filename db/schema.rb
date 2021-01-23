# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_23_014015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidate_civil_judgement_entries", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.string "judgement_type"
    t.string "record_id"
    t.string "court"
    t.string "sentence"
    t.integer "jne_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_candidate_civil_judgement_entries_on_candidate_id"
  end

  create_table "candidate_criminal_conviction_entries", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.string "record_id"
    t.date "date"
    t.string "court"
    t.string "crime"
    t.string "sentence"
    t.string "sentence_type"
    t.string "status"
    t.integer "jne_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_candidate_criminal_conviction_entries_on_candidate_id"
  end

  create_table "candidate_education_entries", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.string "education_type"
    t.string "center"
    t.string "career"
    t.boolean "finished"
    t.integer "jne_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_candidate_education_entries_on_candidate_id"
  end

  create_table "candidate_graduate_education_entries", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.string "grad_school"
    t.string "major"
    t.boolean "finished"
    t.boolean "graduated"
    t.integer "degree_year"
    t.boolean "master_degree"
    t.boolean "phd"
    t.text "comments"
    t.integer "jne_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_candidate_graduate_education_entries_on_candidate_id"
  end

  create_table "candidate_income_entries", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.integer "year", null: false
    t.string "income_type", null: false
    t.decimal "amount", precision: 10, scale: 2
    t.integer "jne_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_candidate_income_entries_on_candidate_id"
  end

  create_table "candidate_political_organization_resignation_entries", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.integer "political_organization_id"
    t.string "political_organization_name"
    t.integer "resignation_year"
    t.text "comments"
    t.integer "jne_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_political_organization_resignations_on_candidate_id"
  end

  create_table "candidate_political_party_office_entries", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.integer "political_organization_id"
    t.string "political_organization_name"
    t.string "office"
    t.integer "start_year"
    t.integer "end_year"
    t.text "comments"
    t.integer "jne_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_candidate_political_party_office_entries_on_candidate_id"
  end

  create_table "candidate_previous_elected_office_entries", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.integer "political_organization_id"
    t.string "political_organization_name"
    t.integer "office_id"
    t.string "office"
    t.integer "start_year"
    t.integer "end_year"
    t.text "comments"
    t.integer "jne_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_candidate_previous_elected_office_entries_on_candidate_id"
  end

  create_table "candidate_property_entries", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.string "property_type"
    t.string "registry_type"
    t.decimal "value", precision: 12, scale: 2
    t.string "license_plate_or_public_record"
    t.string "address"
    t.string "description"
    t.text "comments"
    t.integer "jne_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_candidate_property_entries_on_candidate_id"
  end

  create_table "candidate_university_education_entries", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.string "university"
    t.string "degree"
    t.boolean "finished"
    t.boolean "graduated"
    t.integer "degree_year"
    t.text "comments"
    t.integer "jne_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_candidate_university_education_entries_on_candidate_id"
  end

  create_table "candidate_work_experience_entries", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.string "workplace"
    t.string "profession"
    t.integer "start_year"
    t.integer "end_year"
    t.integer "jne_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_candidate_work_experience_entries_on_candidate_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "electoral_process_id", null: false
    t.bigint "political_organization_id", null: false
    t.string "residence_ubigeo"
    t.string "residence_region"
    t.string "residence_province"
    t.string "residence_district"
    t.string "postulation_ubigeo"
    t.integer "office_id", null: false
    t.integer "secondary_office_id"
    t.integer "jne_id", null: false
    t.decimal "total_properties_value", precision: 12, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "designated"
    t.integer "number"
    t.index ["electoral_process_id"], name: "index_candidates_on_electoral_process_id"
    t.index ["person_id"], name: "index_candidates_on_person_id"
    t.index ["political_organization_id"], name: "index_candidates_on_political_organization_id"
  end

  create_table "electoral_processes", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.date "started_at"
    t.integer "jne_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "individual_financial_contributions", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.string "period"
    t.decimal "amount_money", precision: 12, scale: 2, default: "0.0"
    t.decimal "amount_others", precision: 12, scale: 2, default: "0.0"
    t.decimal "amount_total", precision: 12, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_individual_financial_contributions_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "identification_number"
    t.string "family_name"
    t.string "mothers_maiden_name"
    t.string "names"
    t.date "date_of_birth"
    t.string "country_of_birth"
    t.string "profile_photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "total_individual_financial_contributions", precision: 12, scale: 2, default: "0.0"
    t.decimal "total_tax_debts", precision: 12, scale: 2, default: "0.0"
    t.string "gender"
  end

  create_table "political_organization_stats", force: :cascade do |t|
    t.bigint "political_organization_id", null: false
    t.bigint "electoral_process_id", null: false
    t.integer "total_candidates_with_sentences", default: 0
    t.integer "total_sentences", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "total_candidates", default: 0
    t.integer "total_designated", default: 0
    t.integer "total_m", default: 0
    t.integer "total_f", default: 0
    t.index ["electoral_process_id"], name: "index_political_organization_stats_on_electoral_process_id"
    t.index ["political_organization_id"], name: "index_political_organization_stats_on_political_organization_id"
  end

  create_table "political_organizations", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "logo"
    t.date "enrolled_at"
    t.string "website"
    t.string "organization_type"
    t.integer "jne_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tax_debts", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.string "period"
    t.decimal "amount", precision: 12, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_tax_debts_on_person_id"
  end

  add_foreign_key "candidate_civil_judgement_entries", "candidates"
  add_foreign_key "candidate_criminal_conviction_entries", "candidates"
  add_foreign_key "candidate_education_entries", "candidates"
  add_foreign_key "candidate_graduate_education_entries", "candidates"
  add_foreign_key "candidate_income_entries", "candidates"
  add_foreign_key "candidate_political_organization_resignation_entries", "candidates"
  add_foreign_key "candidate_political_party_office_entries", "candidates"
  add_foreign_key "candidate_previous_elected_office_entries", "candidates"
  add_foreign_key "candidate_property_entries", "candidates"
  add_foreign_key "candidate_university_education_entries", "candidates"
  add_foreign_key "candidate_work_experience_entries", "candidates"
  add_foreign_key "candidates", "electoral_processes"
  add_foreign_key "candidates", "people"
  add_foreign_key "candidates", "political_organizations"
  add_foreign_key "individual_financial_contributions", "people"
  add_foreign_key "political_organization_stats", "electoral_processes"
  add_foreign_key "political_organization_stats", "political_organizations"
  add_foreign_key "tax_debts", "people"
end
