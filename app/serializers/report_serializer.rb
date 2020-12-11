class ReportSerializer < ActiveModel::Serializer
  attributes :sender, :message 
  belongs_to :device 

end
