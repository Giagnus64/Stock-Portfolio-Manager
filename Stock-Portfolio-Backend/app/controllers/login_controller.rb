class LoginController < ApplicationController
    skip_before_action :authorized

    def create
        user = User.find_by(email: login_params[:email])
        if user && user.authenticate(login_params[:password])
            token = encode_token({user_id: user.id})
            userHash = user.as_json(only: [:id, :email, :name])
            puts userHash
            userHash[:token] = token
            render json: userHash, status: :accepted
        else
            render json: {messages: ["Invalid Email or Password! Please try again!"]}, status: :unauthorized
        end
    end

    private

    def login_params
        params.permit(:email, :password)
    end

end
