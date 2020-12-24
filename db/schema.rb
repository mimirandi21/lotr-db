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

ActiveRecord::Schema.define(version: 2020_12_23_202725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movie_people", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "person_id"
    t.text "character"
    t.text "other_names"
    t.text "title_or_position"
    t.text "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies", force: :cascade do |t|
    t.text "title"
    t.text "imdb_link"
    t.text "edition"
    t.text "plot_summary"
    t.interval "length"
    t.text "fun_fact_1"
    t.text "fun_fact_2"
    t.text "fun_fact_3"
    t.float "imdb_review"
    t.bigint "metacritic_review"
    t.text "rating"
    t.text "rotten_tomato_review"
    t.text "img_url"
    t.text "trailer"
    t.text "genres"
    t.bigint "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people", force: :cascade do |t|
    t.text "name"
    t.text "imdb_link"
    t.text "img_url"
    t.bigint "birth_year"
    t.bigint "death_year"
    t.text "credit"
    t.text "fun_fact_1"
    t.text "fun_fact_2"
    t.text "fun_fact_3"
    t.text "quote_1"
    t.text "quote_2"
    t.text "quote_3"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_movies", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "movie_id"
    t.boolean "user_own"
    t.bigint "user_rating"
    t.text "user_notes"
    t.text "private_notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.text "password_digest"
    t.uuid "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
