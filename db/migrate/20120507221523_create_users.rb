class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :type
      t.string :password_digest
      t.references :course
      t.references :bookmark

      t.timestamps
    end
    add_index :users, :course_id
    add_index :users, :bookmark_id
  end
end
