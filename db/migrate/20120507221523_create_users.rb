class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :type
      t.string :password_digest
      t.references :courses
      t.references :bookmarks

      t.timestamps
    end
    add_index :users, :courses_id
    add_index :users, :bookmarks_id
  end
end
