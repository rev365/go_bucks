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

ActiveRecord::Schema[7.0].define(version: 2023_10_26_092304) do
  create_table "go_bucks_transactions", force: :cascade do |t|
    t.integer "from_wallet_id"
    t.integer "to_wallet_id", null: false
    t.bigint "amount", null: false
    t.string "type"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_wallet_id"], name: "index_go_bucks_transactions_on_from_wallet_id"
    t.index ["to_wallet_id"], name: "index_go_bucks_transactions_on_to_wallet_id"
    t.index ["type"], name: "index_go_bucks_transactions_on_type"
  end

  create_table "go_bucks_wallets", force: :cascade do |t|
    t.integer "balance", default: 0, null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_go_bucks_wallets_on_user_id"
    t.check_constraint "balance >= 0", name: "balance_check"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "go_bucks_transactions", "go_bucks_wallets", column: "from_wallet_id"
  add_foreign_key "go_bucks_transactions", "go_bucks_wallets", column: "to_wallet_id"
  add_foreign_key "go_bucks_wallets", "users"
end
