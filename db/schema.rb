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

ActiveRecord::Schema[7.0].define(version: 2023_07_13_143154) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "allowances", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deductions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departements", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "city"
    t.string "country"
    t.boolean "manager"
    t.bigint "team_id", null: false
    t.bigint "position_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position_id"], name: "index_employees_on_position_id"
    t.index ["team_id"], name: "index_employees_on_team_id"
  end

  create_table "payslip_allowances", force: :cascade do |t|
    t.bigint "allowance_id", null: false
    t.bigint "payslip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["allowance_id"], name: "index_payslip_allowances_on_allowance_id"
    t.index ["payslip_id"], name: "index_payslip_allowances_on_payslip_id"
  end

  create_table "payslip_deductions", force: :cascade do |t|
    t.bigint "deduction_id", null: false
    t.bigint "payslip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deduction_id"], name: "index_payslip_deductions_on_deduction_id"
    t.index ["payslip_id"], name: "index_payslip_deductions_on_payslip_id"
  end

  create_table "payslips", force: :cascade do |t|
    t.integer "present"
    t.bigint "employee_id", null: false
    t.integer "absent"
    t.integer "salary"
    t.integer "allowance_amount", default: 0
    t.integer "deduction_amount", default: 0
    t.integer "net"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_payslips_on_employee_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.boolean "manager"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "departement_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departement_id"], name: "index_teams_on_departement_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "employees", "positions"
  add_foreign_key "employees", "teams"
  add_foreign_key "payslip_allowances", "allowances"
  add_foreign_key "payslip_allowances", "payslips"
  add_foreign_key "payslip_deductions", "deductions"
  add_foreign_key "payslip_deductions", "payslips"
  add_foreign_key "payslips", "employees"
  add_foreign_key "teams", "departements"
end
