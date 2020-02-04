class CreateManagements < ActiveRecord::Migration[5.0]
  def change
    create_table :managements do |t|
      t.string :content
      t.string :image
      t.date :day
      t.string :title
      t.references :food, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
