# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_13_164413) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cardios", force: :cascade do |t|
    t.string "name"
    t.string "cardio_type"
    t.integer "hours"
    t.integer "minutes"
    t.integer "seconds"
    t.float "distance"
    t.float "pace"
    t.float "speed"
    t.integer "avg_hr"
    t.integer "max_hr"
    t.integer "kcal"
    t.text "notes"
    t.bigint "workout_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["workout_id"], name: "index_cardios_on_workout_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.text "notes"
    t.bigint "workout_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["workout_id"], name: "index_exercises_on_workout_id"
  end

  create_table "setsets", force: :cascade do |t|
    t.float "weight"
    t.integer "reps"
    t.bigint "exercise_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_id"], name: "index_setsets_on_exercise_id"
  end

  create_table "stats", force: :cascade do |t|
    t.float "weight"
    t.float "bf"
    t.integer "bmi"
    t.float "lean"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date"
    t.index ["user_id"], name: "index_stats_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "height"
    t.date "dob"
    t.string "gender"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workouts", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.integer "hours"
    t.integer "minutes"
    t.integer "seconds"
    t.string "workout_type"
    t.text "notes"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "cardios", "workouts"
  add_foreign_key "exercises", "workouts"
  add_foreign_key "setsets", "exercises"
  add_foreign_key "stats", "users"
  add_foreign_key "workouts", "users"
end
