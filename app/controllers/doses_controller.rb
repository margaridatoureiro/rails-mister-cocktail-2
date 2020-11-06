# frozen_string_literal: true

# top_level_class_documentation_comment: true
class DosesController < ApplicationController
  before_action :fetch_cocktail, only: %i[new create]
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail), notice: 'cool man'
    else
      render 'cocktails/show' ## TRY THIS
    end
  end

  def destroy
    fetch_dose # we don't fetch the cocktail id (will break because of routes)
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def fetch_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def fetch_dose
    @dose = Dose.find(params[:id])
  end
end
