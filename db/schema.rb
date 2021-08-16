
ActiveRecord::Schema.define(version: 2021_08_16_081126) do

  enable_extension "plpgsql"

  create_table "treasurers", force: :cascade do |t|
    t.date "use_date_at"
    t.integer "category_id"
    t.string "use_what"
    t.integer "use_money"
    t.integer "get_money"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
