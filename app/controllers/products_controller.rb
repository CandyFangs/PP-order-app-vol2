class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash.now[:notice] = "W bazie utworzono nowy produkt"
      redirect_to products_path
    else
      flash[:error] = "Nie udało się zapisać"
      puts @product.errors.inspect
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Zmodyfikowano"
      redirect_to products_path
    else
      flash[:error] = "Nie udało się zapisać zmian"
      puts @product.errors.inspect
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Usunięto produkt"
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:category_id, :model, :price, :description, :picture)
  end

end