class LogController < ApplicationController
  before_action :authenticate_user!
  before_action :log_params, only: [:create]

  def index
    logs = current_user.logs.all
    render json: logs.to_json
  end

  def create
    log = current_user.logs.new(log_params)
    if log.save
      status  = :ok
      message = "success"
    else
      status  = :unprocessable_entity
      message = log.errors.full_messages
    end
    render json: ["message": message], status: status
  end

  private

  def log_params
    params.require(:log).permit(:user_id, :detected_ble_token, :rssi, :txpower)
  end
end
