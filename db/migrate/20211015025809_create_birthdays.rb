class CreateBirthdays < ActiveRecord::Migration[6.1]
  def change
    create_table :birthdays do |t|
      t.string :first_name
      t.string :last_name
      t.integer :day
      t.integer :month
      t.integer :year

      t.timestamps
    end
  end
end
