class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)

    @dose.cocktail = @cocktail

    @dose.save
    if @dose.save
    redirect_to cocktail_path(@cocktail)
    else
    @messages = @dose.errors.messages
    render :new
    end
  end

  def delete
      @dose = Dose.find(params[:cocktail_id])
      @dose.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end

