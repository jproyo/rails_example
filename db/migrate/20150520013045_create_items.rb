class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
    	t.string :link
    	t.string :link_type
    	t.text :description
    	t.integer :user_id
    	t.references :users, index: true

      t.timestamps null: false
    end
  end
end
