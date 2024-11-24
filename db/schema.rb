ActiveRecord::Schema[7.1].define(version: 2024_11_23_170934) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lanes", force: :cascade do |t|
    t.string "name"
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_lanes_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "lane_id", null: false
    t.string "name"
    t.integer "priority"
    t.integer "level"
    t.string "status"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lane_id"], name: "index_tasks_on_lane_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "user_projects", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_user_projects_on_project_id"
    t.index ["user_id"], name: "index_user_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "lanes", "projects"
  add_foreign_key "tasks", "lanes"
  add_foreign_key "tasks", "users"
  add_foreign_key "user_projects", "projects"
  add_foreign_key "user_projects", "users"
end
