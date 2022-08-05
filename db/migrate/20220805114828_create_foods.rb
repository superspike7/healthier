class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.float :calories, default: 0
      t.float :carbohydrates, default: 0
      t.float :fats, default: 0
      t.float :protein, default: 0

      t.timestamps
    end
  end
end
