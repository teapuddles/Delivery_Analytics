require 'rails_helper'

RSpec.describe 'Device requests' do
    before do 
    Device.destroy_all
    Heartbeat.destroy_all
    Report.destroy_all
    @device_attributes = { phone_number: "6315329770", carrier: "tmobile" }
    end

# practice test

    describe 'GET /api/all' do 
        before do 
            device = Device.create( @device_attributes )
        end 

        before { get '/api/all' } 

        it 'renders all devices into json' do
        json = JSON.parse(response.body)

        expect(json.size).to eql(1)
        expect(response.status).to eql(200)
    end
end

# endpoint tests

    describe 'POST /api/register' do 

        it  'returns the device attributes' do 

           post '/api/register', params: { phone_number: '6315329770', carrier: 'tmobile' } 
            # adding +1 to phone number for phonelib formatting
            expect(JSON.parse(response.body)['phone_number']).to eql('+16315329770')
            expect(JSON.parse(response.body)['carrier']).to eql('tmobile')

            expect(response.status).to eql(201) 
        end

        it 'returns an error if passed incorrect params' do 
            post '/api/register', params: { phone_number: "8fhj38jdj___", carrier: "boost" } 
            
            expect(JSON.parse(response.body)['error']).to eql('Incorrect Params') 
            expect(JSON.parse(response.body)['status']).to eql(500) 
        end

end

    describe 'PATCH /api/terminate' do
        # before all this, get a device
        before do 
            @device = Device.create(@device_attributes)
        end

        it 'changes disabled_at status to DateTime.now' do 

            @device.disabled_at = DateTime.now

        patch '/api/terminate', params: { device_id: @device.id }

            expect(@device.disabled_at).not_to eql(nil)
            expect(response.status).to eql(202)
        end
end

    describe 'POST /api/alive' do 
        # before all this, get a device
        before do 
            @device = Device.create(@device_attributes)
        end

        it 'creates a new heartbeat instance for a device' do 

        post '/api/alive', params: { device_id: @device.id }
        
        expect(@device.heartbeats.size).to eql(1)
        expect(response.status).to eql(201)

    end
 end

    describe 'POST /api/report' do 
        # before all this, get a device
        before do 
            @device = Device.create(@device_attributes)
        end

        it 'creates a new report instance for a device' do 
        
        post '/api/report', params: { device_id: @device.id }

        expect(@device.reports.size).to eql(1)
        expect(response.status).to eql(201)
        end
    end
end