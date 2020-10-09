module Auth
  class RegistrationsController < DeviseTokenAuth::RegistrationsController

    def create
      user = User.find_by(email: sign_up_params[:email])
      if user.present?
        tmp_user = User.new(sign_up_params)
        render json: {"status": :error, "data": tmp_user}, status: :conflict
      else
        super
      end
    end

  private

    def sign_up_params
      params.require(:registration).permit(:name, :email, :nickname, :ble_address, :password, :password_confirmation)
    end
  end
end