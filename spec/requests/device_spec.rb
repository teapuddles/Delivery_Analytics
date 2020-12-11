require 'rails_helper'

RSpec.describe 'Device requests' do
    before do 
    Device.destroy_all
    Heartbeat.destroy_all
    Report.destroy_all
    @device_attributes = {phone_number: "6315329770", carrier: "tmobile"}
    end

#     describe 'GET /api/all' do 
#         it 'renders all devices into json' do
#         get('/api/all')
#         json = JSON.parse(response.body)

#         expect(json.size).to eql(1)
#         expect(response.status).to eql(200)
#     end
# end
# test repo change
    describe 'POST /api/register' do 
        it 'creates a new device instance' do 

            post '/api/register', params: { device: @device_attributes }

            expect(response).to have_http_status(200) 
            expect(Device.last.carrier).to eql("tmobile")
     end
 end

    describe 'PATCH /api/terminate' do
        # before all this, get a device

        it 'changes disabled_at status to DateTime.now' do 

        patch('/api/terminate')
            expect(device.disabled_at).to eql(DateTime.now)
            expect(response.status).to eql(200)
        end
end

    describe 'POST /api/alive' do 
        # before all this, get a device

        it 'finds the current Device id' do
            @device = Device.create!(
                phone_number: "1112223333",
                carrier: "Verizon"
                )

            expect(@device.id).to_not be_blank
        end 

        it 'creates a new heartbeat instance for a device' do 

        post('/api/alive', params: {heartbeats: {
            device_id: ""
        }})

        expect(response.status).to eql(201)
    end
 end

    describe 'POST /api/report' do 
        # before all this, get a device

        @device = Device.last

        it 'finds the current device id' do 
            expect(@device).to_not be_blank
        end

        it 'creates a new report instance for a device' do 
        
        post('/api/report', params: {reports: {
            device_id: @device.id,
            message: "mother",
            sender: "your"
        }})

        expect(response.status).to eql(200)
        end
    end
end