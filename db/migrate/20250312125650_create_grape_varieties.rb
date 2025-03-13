class CreateGrapeVarieties < ActiveRecord::Migration[8.0]
  def change
    create_table :grape_varieties, id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.string :grape_type
      t.string :pesticides, default: "unknown", null: false
      t.string :care, default: "unknown", null: false
      t.integer :age
      t.float :sugar_level, default: 0.0, null: false
      t.string :flavor_profile
      t.string :planting_density
      t.string :stage, default: "unknown", null: false
      t.string :irrigation
      t.uuid :vineyard_id, null: false

      t.timestamps
    end

    add_index :grape_varieties, :vineyard_id
    add_foreign_key :grape_varieties, :vineyards
  end
end
