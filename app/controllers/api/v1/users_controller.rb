
class Api::V1::UsersController < ApplicationController
    skip_before_action :check_authentication, only: [:create]

    def index 
        @users= User.all
        render json: @users, include:{lists: {include: :cards}}
    end

    def show
        @user = User.find(user_params)  
    end

   #Sign Up
   def create
    @user = User.create(user_params)
    if @user.valid? 
        render json: { user: UserSerializer.new(@user) }, status: :created   
   else
    render json: {error: 'Failed to create user'}, status: :not_acceptable
    end 

  end 
   private
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end 
