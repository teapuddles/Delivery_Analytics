class HeartbeatSerializer < ActiveModel::Serializer
  attributes :id, :device_id, :created_at
  belongs_to :device 

end
