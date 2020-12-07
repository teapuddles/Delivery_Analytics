class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports, id: :uuid do |t|
      t.string :sender
      t.string :message
      t.integer :device_id
      
      t.timestamps
    end
  end
end
