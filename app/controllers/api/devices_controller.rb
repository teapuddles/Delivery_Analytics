class Api::DevicesController < ApplicationController
    before_action :find_device, only: [:terminate, :createHeartbeat, :createReport]

# show devices (not needed)
def all
    render json: Device.all 
end

# create device
def register 
    device = Device.create(device_params) 
    render json: device
end

# update disabled_at
def terminate
    @device.disabled_at = DateTime.now

    @device.update(disableDevice_params)
end 

# create heartbeat only if device has a valid datetime for disabled_at
def createHeartbeat
    if @device.disabled_at = nil 
        @device.heartbeats.create(heartbeat_params)
    else
        render json: {error: "invalid user", status: 500}
    end
end

# create report
def createReport
    @device.reports.create(report_params)
    render json: @device 
end 

private

def find_device
    @device = Device.find(params[:id])
end

def device_params
    params.require(:device).permit(:phone_number, :carrier)
end

def heartbeat_params
    params.require(:heartbeat).permit(:device_id)
end 

def report_params
    params.require(:report).permit(:device_id, :message, :sender)
end 

def disableDevice_params
    params.require(:device).permit(:id)
end

end
