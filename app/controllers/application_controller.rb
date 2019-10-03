
class ApplicationController < ActionController::API
 
  before_action :check_authentication

  def react_app
    render :file => 'public/index.html'
 end
 
  def encode_token(payload) 
      JWT.encode(payload, "Secret", "HS256") 
  end

 
  def auth_header
      request.headers['Authorization']
      # byebug
  end

  def current_user
   
    if decoded_token
      user_id = decoded_token["user_id"]
      User.find(user_id)
    end
  end


  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      # puts token
      begin
        # byebug
        JWT.decode(token, 'Secret')[0] 
       rescue JWT::DecodeError
        nil
      end
    end
  end
 
  # private
  def check_authentication
    render json: { error: 'please log in' }, status: 401 if !logged_in?
 end 
end  


def logged_in?
  !!current_user
end
 

