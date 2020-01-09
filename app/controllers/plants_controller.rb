class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end

  def show
  end

  def new
    @plant = Plant.new
    # authorize @plant
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
    # authorize @plant
    # if plant.save
    #   redirect_to @plant, notice: 'Plant was saved'
    # else
    #   render :new
    # end
  end

  def edit
  end

  def update
    if @plant.update(plant_params)
      redirect_to @plant, notice: 'Plant was updated'
    else
      render :edit
    end
  end

  def destroy
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
                                  :care_instruction, :user_id,
                                  :latitude, :longitude)
  end
end_date
