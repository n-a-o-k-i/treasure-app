class ChangeDatatypeJoinedDateOfMembers < ActiveRecord::Migration[5.1]
  def change
  	change_column :members, :joined_date, :date
  end
end
