# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181220021308) do

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "group_cities_id"
    t.boolean "is_capital"
    t.bigint "goal_group_id"
    t.string "rccv_program"
    t.integer "total_population"
    t.string "metropolitan_area"
    t.string "city_system_dnp"
    t.string "dnp_category"
    t.string "ddt_typology"
    t.bigint "department_id"
    t.text "description"
    t.datetime "delete_at"
    t.string "avatar"
    t.float "urban_population", limit: 24
    t.float "rural_population", limit: 24
    t.string "total_area"
    t.string "foundation_year"
    t.string "folder_avatar", default: "logos/cities/"
    t.text "cod_dane"
    t.text "web_page"
    t.index ["department_id"], name: "index_cities_on_department_id"
    t.index ["goal_group_id"], name: "index_cities_on_goal_group_id"
    t.index ["group_cities_id"], name: "index_cities_on_group_cities_id"
  end

  create_table "countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "delete_at"
  end

  create_table "data_objetives", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "city"
    t.string "answer_year"
    t.text "response", limit: 16777215
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dictionary_objetive_id"
    t.index ["dictionary_objetive_id"], name: "index_data_objetives_on_dictionary_objetive_id"
  end

  create_table "departments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "country_id"
    t.datetime "delete_at"
    t.index ["country_id"], name: "index_departments_on_country_id"
  end

  create_table "dict_univ_cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "description"
    t.string "category"
    t.string "ctype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dictionary_objetives", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description", limit: 16777215
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "measure"
  end

  create_table "eot_data", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "city"
    t.string "answer_year"
    t.string "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "eot_dictionary_id"
    t.index ["eot_dictionary_id"], name: "index_eot_data_on_eot_dictionary_id"
  end

  create_table "eot_dictionaries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.text "indicator"
    t.string "ctype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goal_cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.float "score", limit: 24
    t.date "date_from"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id"
    t.float "goal", limit: 24
    t.bigint "goal_id"
    t.datetime "delete_at"
    t.index ["city_id"], name: "index_goal_cities_on_city_id"
    t.index ["goal_id"], name: "index_goal_cities_on_goal_id"
  end

  create_table "goal_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "delete_at"
  end

  create_table "goals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "number"
    t.string "name"
    t.text "description", limit: 16777215
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "delete_at"
    t.string "avatar"
    t.string "folder_avatar", default: "logos/goals/"
  end

  create_table "group_cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.datetime "delete_at"
  end

  create_table "indicator_values", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.float "score", limit: 24
    t.integer "date_from"
    t.date "date_to"
    t.date "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "indicator_id"
    t.bigint "city_id"
    t.index ["city_id"], name: "index_indicator_values_on_city_id"
    t.index ["indicator_id"], name: "index_indicator_values_on_indicator_id"
  end

  create_table "indicators", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "number"
    t.text "name"
    t.text "description", limit: 16777215
    t.string "national_base_line"
    t.string "year_national_base_line"
    t.string "national_goal"
    t.string "year_national_goal"
    t.string "reference_value_low"
    t.string "reference_value_mid"
    t.string "reference_value_high"
    t.string "trazador_conpes"
    t.boolean "available"
    t.string "institutional_inf"
    t.string "methodological_proposal"
    t.text "comment", limit: 16777215
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "target_id"
    t.bigint "measure_id"
    t.string "target_type", limit: 9
    t.boolean "trazador_goal"
    t.datetime "delete_at"
    t.index ["measure_id"], name: "index_indicators_on_measure_id"
    t.index ["target_id"], name: "index_indicators_on_target_id"
  end

  create_table "measures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "delete_at"
  end

  create_table "ods_ciudatos_data", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "objetive"
    t.text "target"
    t.text "indicator"
    t.string "city"
    t.text "response"
    t.string "source"
    t.string "symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "sex"
    t.string "city"
    t.string "age"
    t.integer "answer_year"
    t.string "unique_id"
    t.string "stratum"
    t.string "location"
    t.string "zone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "person_has_questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "answer", limit: 16777215
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "people_id"
    t.bigint "question_id"
    t.index ["people_id"], name: "index_person_has_questions_on_people_id"
    t.index ["question_id"], name: "index_person_has_questions_on_question_id"
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description", limit: 16777215
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "delete_at"
  end

  create_table "targets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "name", limit: 16777215
    t.string "number"
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "goal_id"
    t.datetime "delete_at"
    t.text "description", limit: 16777215
    t.index ["goal_id"], name: "index_targets_on_goal_id"
  end

  create_table "themes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "towns", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "university_cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "city"
    t.string "answer_year"
    t.text "response", limit: 16777215
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dict_univ_city_id"
    t.index ["dict_univ_city_id"], name: "index_university_cities_on_dict_univ_city_id"
  end

  create_table "user_by_cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "user_id"
    t.bigint "city_id"
    t.index ["city_id"], name: "index_user_by_cities_on_city_id"
    t.index ["user_id"], name: "index_user_by_cities_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.string "surname"
    t.string "identification_type"
    t.string "identification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.datetime "delete_at"
    t.bigint "city_id"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "cities", "departments"
  add_foreign_key "cities", "goal_groups"
  add_foreign_key "cities", "group_cities", column: "group_cities_id"
  add_foreign_key "data_objetives", "dictionary_objetives"
  add_foreign_key "departments", "countries"
  add_foreign_key "eot_data", "eot_dictionaries"
  add_foreign_key "goal_cities", "cities"
  add_foreign_key "goal_cities", "goals"
  add_foreign_key "indicator_values", "cities"
  add_foreign_key "indicator_values", "indicators"
  add_foreign_key "indicators", "measures"
  add_foreign_key "indicators", "targets"
  add_foreign_key "person_has_questions", "people", column: "people_id"
  add_foreign_key "person_has_questions", "questions"
  add_foreign_key "targets", "goals"
  add_foreign_key "university_cities", "dict_univ_cities"
  add_foreign_key "user_by_cities", "cities"
  add_foreign_key "user_by_cities", "users"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "roles"
end
