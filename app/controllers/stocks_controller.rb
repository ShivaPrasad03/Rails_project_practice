class StocksController < ApplicationController
    skip_before_action :verify_authenticity_token

    before_action   :set_attr, only: %i[show destroy edit update]
   

    def home
        render html: "hi this is stocks controller route"
    end

    # GET /stocks/1 
    def show
        render json: @stock
    end

     # GET /stocks
    def index 
        @stocks = Stock.all
        render json: @stocks
    end

    # GET /stocks/new
    def new 
        @stock = Stock.new  
    end 

    # POST /stocks
    def create 
        @stock = Stock.new(stock_params)
        if @stock.save
            render json: @stock, status: :created
        else 
            render json: @stock.errors
        end
    end

      # GET /stocks/1/edit
    def edit 
    end 

     # PATCH/PUT /stocks/1 
    def update 
        if @stock.update(stock_params)
            render json: @stock, status: 200
        else 
            render json: @stock.errors
        end
    end

     # DELETE /stocks/1 
    def destroy  
        @stock.destroy
        render json: @stock, status: 200
    end

    private

     # Only allow a list of trusted parameters through.
    def stock_params 
        params.require(:stock).permit(:stock_name, :price, :market_capital)
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_attr 
        @stock = Stock.find(params[:id]) 
    end
end
