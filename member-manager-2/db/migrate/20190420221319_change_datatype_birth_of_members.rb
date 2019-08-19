class ChangeDatatypeBirthOfMembers < ActiveRecord::Migration[5.1]
  def change
  	change_column :members, :birth, :date
  end
end
