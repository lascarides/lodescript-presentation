class AddAncestryToPiece < ActiveRecord::Migration
  def change
    add_column :pieces, :ancestry, :string
    add_column :pieces, :position, :integer
  end
end
