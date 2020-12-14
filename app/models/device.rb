class Device < ApplicationRecord
    has_many :heartbeats
    has_many :reports

    validates :phone_number, phone: { possible: true, allow_blank: false}, uniqueness: false 
    before_save :format_phone

    
    def format_phone
        self.phone_number = Phonelib.parse(phone_number).e164
    end

end
