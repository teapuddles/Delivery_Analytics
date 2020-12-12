class Api::DevicesController < ApplicationController
    before_action :find_device, only: [:terminate, :createHeartbeat, :createReport]

# show devices (not needed)
def all
    render json: Device.all 
end

# create device
def register 
    device = Device.new(device_params)
    if device.phone_number && device.carrier
        device.save
        render json: device
     else
        render json: { error: 'Incorrect Params', status: 500 }
    end
end

# update disabled_at
def terminate
    @device.disabled_at = DateTime.now

    @device.update(disable_device_params)

    render json: @device
end 

# create heartbeat only if device has nil for disabled_at
def createHeartbeat
    if  @device.disabled_at.nil?
        @device.heartbeats.create(heartbeat_params)
        render json: @device
    else
        render json: { error: "invalid user", status: 500 }
    end
end

# create report
def createReport
    @device.reports.create(report_params)
    render json: @device 
end 

private

def find_device
    @device = Device.find(params[:device_id])
end

def device_params
    params.permit(:phone_number, :carrier)
end

def heartbeat_params
    params.permit(:device_id)
end 

def report_params
    params.require(:report).permit(:device_id, :message, :sender)
end 

def disable_device_params
    params.permit(:id)
end

end
