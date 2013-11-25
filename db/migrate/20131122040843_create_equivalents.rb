class CreateEquivalents < ActiveRecord::Migration
  def change
    create_table :equivalents do |t|
      t.string :name
      t.string :url
      t.references :organization
      t.string :namespace

      t.timestamps
    end
  end
end
