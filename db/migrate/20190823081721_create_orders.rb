class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.date :date
      t.integer :timeslot
      t.integer :user_id
      t.string :state, default: "en attente"

      t.timestamps
    end
  end
end
