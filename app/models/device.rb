class Device < ApplicationRecord
    has_many :heartbeats
    has_many :reports

    before_save :format_phone
    validates :phone_number, presence: true, allow_blank: false

    private

    def format_phone
        self.phone_number = Phonelib.parse(phone_number).e164
    end

end
