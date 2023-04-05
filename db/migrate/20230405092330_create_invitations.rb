class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.string :email
      t.string :unique_key
      t.datetime :expired_at
      t.string :status

      t.timestamps
    end
  end
end
