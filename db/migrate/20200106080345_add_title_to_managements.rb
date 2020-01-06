class AddTitleToManagements < ActiveRecord::Migration[5.0]
  def change
    add_column :managements, :title, :string
  end
end
