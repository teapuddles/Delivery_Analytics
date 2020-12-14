class Api::DevicesController < ApplicationController
    before_action :find_device, only: [:terminate, :create_heartbeat, :create_report]    

# show devices (not needed)
def all
    render json: Device.all 
end

# create device
def register 
    device = Device.new(device_params)
    if device.valid? && device.carrier
        if device.save
            render json: device.to_json, status: :created 
        end
     else
        render json: { error: 'Incorrect Params', status: 500 }
    end
end

# update disabled_at
def terminate
    if @device.id 
       @device.disabled_at = DateTime.now

       @device.update(disable_device_params)

       render json: @device.to_json, status: :accepted
    else
       render json: { error: "Invalid User", status: 500 }
    end
end 

# create heartbeat only if device has nil for disabled_at
def create_heartbeat
    if  @device.disabled_at.nil? && @device.id
        @device.heartbeats.create(heartbeat_params)

        render json: @device.heartbeats.to_json, status: :created
    else
        render json: { error: "Invalid User", status: 500 }
    end
end

# create report
def create_report
    if  @device.disabled_at.nil?
        @device.reports.create(report_params)

        render json: @device.reports.to_json, status: :created
    else
        render json: { error: "Invalid User", status: 500 }
    end
end 

private

def find_device
    @device = Device.find(params[:device_id])
end

def phone_number_format
    phone_number.phone.e164
end

def device_params
    params.permit(:phone_number, :carrier)
end

def heartbeat_params
    params.permit(:device_id)
end 

def report_params
    params.permit(params[:device_id], :message, :sender)
end 

def disable_device_params
    params.permit(:id)
end

end
