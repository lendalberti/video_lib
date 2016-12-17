class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string 		:name
      t.integer		:company_id
      
      t.timestamps
    end
    add_foreign_key :users, :companies,   on_delete: :cascade
  end
end
