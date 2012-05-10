class RenameTypeOnUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.remove :type
      t.string :status
    end
  end

  def down
    change_table :users do |t|
      t.string :type
      t.remove :status
    end
  end
end
