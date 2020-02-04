class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.integer :calorie
      t.integer :carbohydrate
      t.integer :protein
      t.integer :fat
      t.integer :salt_equivalent
      t.integer :dietary_fiber
      t.timestamps
    end
  end
end
