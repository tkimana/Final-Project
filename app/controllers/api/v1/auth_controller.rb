
class Api::V1::AuthController < ApplicationController


 skip_before_action :check_authentication, only: [:create]
    def create
         user = User.find_by(email: params[:email])
        
         puts params[:password]
        if user && user.authenticate(params[:password])
          
            render json: {email: user.email, token: encode_token({user_id: user.id})}
        else 
            puts "I never got past authenticate"
            render json: {error: 'Invalid email or password'}
        end
    end 
  
end 