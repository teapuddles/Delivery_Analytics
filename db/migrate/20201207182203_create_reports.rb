class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports, id: :uuid do |t|
      t.string :sender
      t.string :message
      t.uuid :device_id
    end
  end
end
