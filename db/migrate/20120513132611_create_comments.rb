class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :course
      t.text :content

      t.timestamps
    end
    add_index :comments, :course_id
    add_index :comments, :user_id
  end
end
