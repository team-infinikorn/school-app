class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.datetime :dob
      t.string :phone_no
      t.string :emergency_phone_no
      t.text :address

      t.timestamps
    end
  end
end
