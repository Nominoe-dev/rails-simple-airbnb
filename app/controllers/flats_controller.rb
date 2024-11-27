class FlatsController < ApplicationController

  def index
    @flats = Flat.all
  end

  def show
    @flat= Flat.find(params[:id])
  end

  def new
    @flat = Flat.new # Needed to instantiate the form_with
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.save

    redirect_to flats_path(@flat)
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    # No need for app/views/flats/update.html.erb
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    # No need for app/views/flats/destroy.html.erb
    redirect_to flats_path, status: :see_other
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
