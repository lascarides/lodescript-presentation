class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :name
      t.text :lode
      t.references :scheme

      t.timestamps
    end
  end
end
