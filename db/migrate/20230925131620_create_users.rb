class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.integer :posts_count, default: 0
      t.timestamps
    end
  end
end
