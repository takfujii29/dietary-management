class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.integer :calorie
      t.float :carbohydrate
      t.float :protein
      t.float :fat
      t.float :salt_equivalent
      t.float :dietary_fiber
      t.timestamps
    end
  end
end
