class DeviceSerializer < ActiveModel::Serializer
  attributes :id, :phone_number, :carrier, :disabled_at

  has_many :heartbeats
  has_many :reports
  byebug
end
