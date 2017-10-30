class MaterialsController < ApplicationController

  def index
    @materials = Material.all
  end

  def new
    @material = Material.new
  end

  def show
    @material = Material.find(params[:id])
  end

  def create
    @material = Material.new(material_params)
    if @material.save
      flash.now[:notice] = "W bazie utworzono nowy materiał"
      redirect_to materials_path
    else
      flash[:error] = "Nie udało się zapisać"
      render :new
    end
  end

  def edit
    @material = Material.find(params[:id])
  end

  def update
    @material = Material.find(params[:id])
    if @material.update(material_params)
      flash[:notice] = "Zmodyfikowano"
      redirect_to materials_path
    else
      flash[:error] = "Nie udało się zapisać zmian"
      render :edit
    end
  end

  def destroy
    @material = Material.find(params[:id])
    @material.destroy
    flash[:notice] = "Usunięto materiał"
    redirect_to materials_path
  end

  private

  def material_params
    params.require(:material).permit(:brand)
  end

end