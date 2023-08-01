class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products
  def index
    if params[:stock_id].present?
      @products = Product.all.where(stock_id: params[:stock_id])
      render json: @products
    else
      @products = Product.all
      render json: @products
    end
  end

  # GET products/1 
  def show
    render json: @product
    
  end

  # GET products/new
  def new
    @product = Product.new
  end

  # GET products/1/edit
  def edit
  end

  # POST /products 
  def create
    @product = Product.new(product_params)
    @product.stock_id = params[:stock_id]
    
      if @product.save
       render json: @product, status: :created
      else 
       render json: @product.errors
      end
  end

  # PATCH/PUT /products/1 
  def update
      if @product.update(product_params)
        render json: @product, status: 200
      else
        render json: @product.errors
      end
   
  end

  # DELETE /products/:id
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name)
    end
end
