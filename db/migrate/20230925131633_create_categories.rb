class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories, id: false do |t|
      t.string :key, primary_key: true
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
