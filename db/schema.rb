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

ActiveRecord::Schema.define(version: 2019_11_15_010342) do

  create_table "accessories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "name"
    t.bigint "cospul_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cospul_detail_id"], name: "index_accessories_on_cospul_detail_id"
  end

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "cospul_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "head"
    t.text "top"
    t.text "inner"
    t.text "bottom"
    t.text "shoe"
    t.bigint "cospul_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cospul_id"], name: "index_cospul_details_on_cospul_id"
  end

  create_table "cospul_pictures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "picture"
    t.integer "user_id"
    t.bigint "cospul_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cospul_id"], name: "index_cospul_pictures_on_cospul_id"
  end

  create_table "cospuls", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id", null: false
    t.integer "likes_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cospuls_on_user_id"
  end

  create_table "gutentag_taggings", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "tag_id", null: false
    t.integer "taggable_id", null: false
    t.string "taggable_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_gutentag_taggings_on_tag_id"
    t.index ["taggable_type", "taggable_id", "tag_id"], name: "unique_taggings", unique: true
    t.index ["taggable_type", "taggable_id"], name: "index_gutentag_taggings_on_taggable_type_and_taggable_id"
  end

  create_table "gutentag_tags", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "taggings_count", default: 0, null: false
    t.index ["name"], name: "index_gutentag_tags_on_name", unique: true
    t.index ["taggings_count"], name: "index_gutentag_tags_on_taggings_count"
  end

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "cospul_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cospul_id"], name: "index_likes_on_cospul_id"
    t.index ["user_id", "cospul_id"], name: "index_likes_on_user_id_and_cospul_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.string "image"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accessories", "cospul_details"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cospul_details", "cospuls"
  add_foreign_key "cospul_pictures", "cospuls"
  add_foreign_key "cospuls", "users"
end
