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

ActiveRecord::Schema.define(version: 2020_07_14_150232) do

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "creditcards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "payjp_custumer_id", null: false
    t.string "payjp_card_id", null: false
    t.index ["user_id"], name: "index_creditcards_on_user_id"
  end

  create_table "destinations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "post_code", null: false
    t.bigint "prefecture_id", null: false
    t.string "city", null: false
    t.string "block_num", null: false
    t.string "bill_name"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.string "tel"
    t.index ["prefecture_id"], name: "index_destinations_on_prefecture_id"
    t.index ["user_id"], name: "index_destinations_on_user_id"
  end

  create_table "itemimages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.string "image", null: false
    t.index ["item_id"], name: "index_itemimages_on_item_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.text "description"
    t.timestamp "closed_time"
    t.bigint "buyer_id"
    t.bigint "prefecture_id", null: false
    t.bigint "category_id", null: false
    t.bigint "brand_id"
    t.string "size", null: false
    t.integer "condition_id", null: false
    t.integer "preparation_id", null: false
    t.integer "postage_id", null: false
    t.bigint "user_id", null: false
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "destination_id"
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["destination_id"], name: "index_items_on_destination_id"
    t.index ["prefecture_id"], name: "index_items_on_prefecture_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "prefectures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "encrypted_password", null: false
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.date "birthday", null: false
    t.text "description"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "creditcards", "users"
  add_foreign_key "destinations", "prefectures"
  add_foreign_key "destinations", "users"
  add_foreign_key "itemimages", "items"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "destinations"
  add_foreign_key "items", "prefectures"
  add_foreign_key "items", "users"
end
