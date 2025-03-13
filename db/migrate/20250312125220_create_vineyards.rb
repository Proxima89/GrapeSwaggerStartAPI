class CreateVineyards < ActiveRecord::Migration[8.0]
  def change
    create_table :vineyards, id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.string :name
      t.string :location
      t.integer :size
      t.integer :age
      t.string :soil_type, default: "unknown", null: false
      t.string :owner
      t.string :season
      t.string :irrigation
      t.string :weather

      t.timestamps
    end
  end
end
