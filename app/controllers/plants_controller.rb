class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def new
    @plant = Plant.new
    # authorize @plant
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
       # authorize @plant
    if @plant.save
      redirect_to plant_path(@plant)
    else
      render :new
    end
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])
    if @plant.update(plant_params)
      @plant.save
      redirect_to @plant, notice: 'Plant was updated'
    else
      render :edit
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to plants_url,
    notice: 'Plant was destroyed'
  end

  private
  # def set_plant
  #   @plant = Plant.find(params[:id])
  #   authorize @plant
  # end

  def plant_params
    params.require(:plant).permit(:name, :description, :price,
                                  :care_instructions, :user_id, :photo, :photo_cache,
                                  :latitude, :longitude)
  end
end
