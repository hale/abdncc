class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string  :name
      t.string  :ccode
      t.integer :credits
      t.string  :coordinator
      t.string  :prereq
      t.text  :note
      t.text    :description
      t.text    :assessment
      t.integer :level
      t.string  :subject
      t.string  :department

      t.timestamps
    end
  end
end
