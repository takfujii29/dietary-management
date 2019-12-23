class CreateUserFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :user_foods do |t|
      t.references :user, foreign_key: true
      t.references :food, foreign_key: true
      t.timestamps
    end
  end
end
