class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :name
      t.text :description
      t.integer :privacy, default: 0
      t.integer :user_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
