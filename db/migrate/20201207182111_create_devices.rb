class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices, id: :uuid do |t|
      t.string :phone_number
      t.string :carrier
      t.datetime :disabled_at, default: nil

      t.datetime :created_at
      t.datetime :updated_at 
    end
  end
end
