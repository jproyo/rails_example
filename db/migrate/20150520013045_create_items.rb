class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
    	t.string :link
    	t.string :link_type
      t.string :user_id
    	t.text :description
    	t.references :users, index: true

      t.timestamps null: false
    end
    add_foreign_key :items, :users
  end
end
