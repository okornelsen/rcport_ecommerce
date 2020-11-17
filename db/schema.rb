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

ActiveRecord::Schema.define(version: 2020_11_17_011824) do

  create_table "categories", force: :cascade do |t|
    t.string "vehicle_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
  end

  create_table "pricetypes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "productcategories", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_productcategories_on_category_id"
    t.index ["product_id"], name: "index_productcategories_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "price"
    t.integer "sku"
    t.string "description"
    t.string "part_no"
    t.string "brand"
    t.string "terrain_type"
    t.string "drive_train"
    t.string "scale"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "pricetype_id", null: false
    t.integer "saleprice"
    t.index ["pricetype_id"], name: "index_products_on_pricetype_id"
  end

  add_foreign_key "productcategories", "categories"
  add_foreign_key "productcategories", "products"
  add_foreign_key "products", "pricetypes"
end
