class DevicesController < ApplicationController
    before_action :find_device, only: [:update]

# create device
def index
    render json: Device.all 
end

def create
    device = Device.create(device_params)
    render json: device
end

# update disabled_at
def update
    @device.disabled_at = DateTime.now

    @device.update(device_params)
    render json: @device
    redirect_to api_terminate_path(@device)
end 

# create heartbeat

# create report

private

def find_device
    @device = Device.find(params[:id])
end

def device_params
    params.require(:device).permit(:phone_number, :carrier, :disabled_at)
end

end
