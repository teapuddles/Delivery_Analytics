class CreateHeartbeats < ActiveRecord::Migration[6.0]
  def change
    create_table :heartbeats, id: :uuid do |t|

      t.timestamps
    end
  end
end
