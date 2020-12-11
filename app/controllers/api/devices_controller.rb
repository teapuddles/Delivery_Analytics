class Api::DevicesController < ApplicationController
    before_action :find_device, only: [:terminate]

# show devices (not needed)
def index
    render json: Device.all 
end

# create device
def register 
    device = Device.create(device_params)
    render json: device
    redirect_to api_register_path 
end

# update disabled_at
def terminate
    @device.disabled_at = DateTime.now

    @device.update(disableDevice_params)
    render json: @device
end 

# create heartbeat
def createHeartbeat
    @device.heartbeats.create(heartbeat_params)
    render json: @device 
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
