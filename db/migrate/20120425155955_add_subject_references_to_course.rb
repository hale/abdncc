class AddSubjectReferencesToCourse < ActiveRecord::Migration
  def up
    change_table :courses do |t|
      t.remove :subject
      t.references :subject
    end
  end

  def down
    change_table :courses do |t|
      t.remove :subject
      t.string :subject
    end
  end
end
