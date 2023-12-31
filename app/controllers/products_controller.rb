class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :set_categories, only: %i[ new edit create update ] #Se pueden personalizar que loco

  before_action :authenticate_user!

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
    @product =Product.find(params[:id]) #El :id es el /1 que aparece en las rutas, es muy util hehe
  end

  # GET /products/new
  def new
    @product = Product.new
    #PARA ANIDACION
    @product.categories.build #Que se ejecuten los new y edit del controlador de categorias aqui
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    #Se ha modificado para recibir multiples categorias, o no se no me preguntes
    #NO FUE EDITADO NYA
    @product = Product.new(product_params) #Esto se crea como un gran arreglo con todos sus parametros mas el array las categorías, un real curi de curis

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price, :size, :category_ids => [], categories_attributes: [:id, :name]) #Recibir ademas un array de categorias, para muchas categorias hehe
    end
end
