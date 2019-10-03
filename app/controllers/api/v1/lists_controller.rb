class Api::V1::ListsController < ApplicationController
    
        def index 
            @lists= List.all
            render json: @lists, include: :cards
        end
        def show
            @lists= List.find(params[:id])
            render json: @list, include: :cards
          # byebug
        end
    
        def create
            @list = current_user.lists.create(list_params)
            render json: @list, status:201
            
        end 
        #If you want to get the stuff for a User
        def get_user_list
            # byebug
            @lists = List.all.select{|list| list.user_id === current_user.id}
            render json: @lists, status:201
        end 
        def update
       
            @list = List.find(params[list_params])
            @list.update(list_params)
            render json: @list, status: 201
        end   
        def destroy
            @list = List.find(params[:id])
            @list.destroy
        end
    
        def list_params
            params.require(:list).permit(:title, :user_id)
        end
end
