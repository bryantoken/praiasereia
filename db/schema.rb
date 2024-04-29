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

ActiveRecord::Schema[7.1].define(version: 2024_04_29_175753) do
  create_table "MORADORES", primary_key: "ID_MORADOR", id: :integer, charset: "latin1", collation: "latin1_general_ci", force: :cascade do |t|
    t.string "CPF", limit: 11
    t.string "NOME", limit: 100
    t.string "CELULAR", limit: 11
    t.string "BLOCO", limit: 1
    t.integer "APARTAMENTO"
    t.timestamp "DATA_CADASTRO", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["CPF"], name: "CPF", unique: true
  end

  create_table "PROBLEMAS", primary_key: "ID_PROBLEMA", id: :integer, default: nil, charset: "latin1", collation: "latin1_general_ci", force: :cascade do |t|
    t.integer "ID_MORADOR", null: false
    t.string "PROBLEMA"
    t.integer "PRIORIDADE", limit: 2
    t.text "OBSERVACAO"
    t.timestamp "DATA_PROBLEMA", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["ID_MORADOR"], name: "ID_MORADOR"
  end

  create_table "TAG_PESSOAS", primary_key: "NUM_TAG_PESSOA", id: :integer, default: nil, charset: "latin1", collation: "latin1_general_ci", force: :cascade do |t|
    t.integer "ID_MORADOR", null: false
    t.string "AUTORIZACAO"
    t.string "COMPROVANTE"
    t.timestamp "DATA_PEDIDO", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["ID_MORADOR"], name: "ID_MORADOR"
  end

  create_table "TAG_VEICULOS", primary_key: "NUM_TAG_VEICULO", id: :integer, default: nil, charset: "latin1", collation: "latin1_general_ci", force: :cascade do |t|
    t.integer "ID_MORADOR", null: false
    t.string "MODELO"
    t.string "MARCA"
    t.string "PLACA"
    t.string "COR"
    t.timestamp "DATA_PEDIDO", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["ID_MORADOR"], name: "ID_MORADOR"
  end

  create_table "users", charset: "latin1", collation: "latin1_general_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "PROBLEMAS", "MORADORES", column: "ID_MORADOR", primary_key: "ID_MORADOR", name: "PROBLEMAS_ibfk_1"
  add_foreign_key "TAG_PESSOAS", "MORADORES", column: "ID_MORADOR", primary_key: "ID_MORADOR", name: "TAG_PESSOAS_ibfk_1"
  add_foreign_key "TAG_VEICULOS", "MORADORES", column: "ID_MORADOR", primary_key: "ID_MORADOR", name: "TAG_VEICULOS_ibfk_1"
end
