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

ActiveRecord::Schema.define(version: 20160929010303) do

  create_table "atividades", force: :cascade do |t|
    t.integer  "evento_id"
    t.string   "tituloAtividade"
    t.string   "assunto"
    t.string   "resumo"
    t.string   "tipo"
    t.string   "dataHora_inicio"
    t.string   "dataHora_fim"
    t.string   "local"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "responsavel"
    t.index ["evento_id"], name: "index_atividades_on_evento_id"
  end

  create_table "eventos", force: :cascade do |t|
    t.string   "titulo"
    t.string   "organizador"
    t.string   "local"
    t.string   "dataHora_inicio"
    t.string   "dataHora_fim"
    t.string   "assunto"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "participantes", force: :cascade do |t|
    t.string   "nome"
    t.string   "rg"
    t.string   "dataNasc"
    t.string   "email"
    t.string   "formacao"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "foto"
    t.integer  "atividade_id"
    t.index ["atividade_id"], name: "index_participantes_on_atividade_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

end
