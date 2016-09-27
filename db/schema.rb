# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160927034311) do

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
  end

  add_index "atividades", ["evento_id"], name: "index_atividades_on_evento_id"

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
  end

  add_index "participantes", ["atividade_id"], name: "index_participantes_on_atividade_id"

end
