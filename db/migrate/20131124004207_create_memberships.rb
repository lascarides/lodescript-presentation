class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :organization, index: true
      t.references :thing, index: true
      t.integer :row_order
      t.string :source_url

      t.timestamps
    end
  end
end
