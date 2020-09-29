class LogController < ApplicationController
  before_action :authenticate_user!
  before_action :log_params, only: [:create]

  def index
    render :json => { name: "yamada" }
  end

  def create
    log = current_user.logs.new(log_params)
    if log.save
      render json: {"status": "created"}
    else
      render json: {"stauts": "failed"}
    end
  end

  private

  def log_params
    params.require(:log).permit(:user_id, :detected_ble_address, :rssi)
  end
end
