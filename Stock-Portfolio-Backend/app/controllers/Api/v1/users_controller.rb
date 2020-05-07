class UsersController < ApplicationController

    #skip_before_action :authorized, only:[:create]

    #create new user
    def create
        #get new params
        new_user_params = user_params
        new_user_params[:account_balance] = 5000.00
        #create new user
        user = User.create(new_user_params)
        if(user.valid?)
            #generate auth token
            token = encode_token({user_id: user.id})
            #generate user hash
            userHash = user.as_json(only: [:id, :email])
            #add token to hash
            userHash[:token] = token
            #respond with user's info as json
            render json: userHash, status: :created
        else
            #if an error occurs, print errors
            render json: {messages: user.errors.full_messages}
        end
    end

    #show user portfolio
    def show
        user = User.find_by(email: user_params[:email])
    end


#    #Extra methods if time permits
#     def edit/update
    
#     end

#     def destroy 
    
#     end

    private

    def user_params
        params.require(:user).permit(:email, :password, :name)
    end
    

end
