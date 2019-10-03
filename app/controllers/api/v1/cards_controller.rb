class Api::V1::CardsController < ApplicationController
    def index 
        @cards= List.all
        render json: @cards
    end
    
    def show
        @cards= Card.find(params[:id])
        render json: @card
    end

    def create
        @card= Card.create(card_params)
        render json: @card, status: 201
        
    end 

    def update
        @card= Card.find(params[:id])
        @card.update(card_params)
        render json: @card, status: 201
    end
    
    def destroy
        @card = Card.find(params[:id])
        @card.destroy
    end
  
    def card_params
      
        params.require(:card).permit([:text, :list_id])
    end

end
