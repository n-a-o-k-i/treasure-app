class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :name
      t.integer :age
      t.integer :gender
      t.date :birth
      t.date :joined_date
      t.integer :grade
      t.string :department
      t.string :address
      t.string :tel

      t.timestamps
    end
  end
end
