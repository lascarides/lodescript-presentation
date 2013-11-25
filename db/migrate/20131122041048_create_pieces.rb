class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.references :membership
      t.string :predicate
      t.string :original_predicate
      t.references :thing
      t.string :content
      t.references :equivalent
      t.boolean :is_active, :default => true

      t.timestamps
    end
  end
end
