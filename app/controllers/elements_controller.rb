class ElementsController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @elements = @product.elements.order(:id)
  end

  def new
    @product = Product.find(params[:product_id])
    @element = @product.elements.new
  end

  def create
    @product = Product.find(params[:product_id])
    @element = @product.elements.new(element_params)
    if @element.save
      flash.now[:notice] = "Przypisano nowy element do produktu"
      redirect_to product_elements_path
    else
      flash[:error] = "Nie udało się zapisać"
      render :new
      puts @element.errors.inspect
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @element = @product.elements.find(params[:id])
    @element.destroy
    flash[:notice] = "Usunięto element"
    redirect_to product_elements_path
  end

  private

  def element_params
    params.require(:element).permit(:name, :material_id, :product_id)
  end

end