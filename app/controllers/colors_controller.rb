class ColorsController < ApplicationController

  def index
    @material = Material.find(params[:material_id])
    @colors = @material.colors.order(:id)
  end

  def new
    @material = Material.find(params[:material_id])
    @color = @material.colors.new
  end

  def create
    @material = Material.find(params[:material_id])
    @color = @material.colors.new(color_params)
    if @color.save
      flash.now[:notice] = "Utworzono nowy kolor"
      redirect_to material_colors_path
    else
      flash[:error] = "Nie udało się zapisać"
      render :new
    end
  end

  def edit
    @material = Material.find(params[:material_id])
    @color = @material.colors.find(params[:id])
  end

  def update
    @material = Material.find(params[:material_id])
    @color = @material.colors.find(params[:id])
    if @color.update(color_params)
      flash[:notice] = "Zmodyfikowano kolor"
      redirect_to material_colors_path
    else
      flash[:error] = "Nie udało się zapisać zmian"
      render :edit
      puts @color.errors.inspect
    end
  end

  def destroy
    @material = Material.find(params[:material_id])
    @color = @material.colors.find(params[:id])
    @color.destroy
    flash[:notice] = "Usunięto materiał"
    redirect_to material_colors_path
  end
  
  private

  def color_params
    params.require(:color).permit(:color, :picture)
  end

end