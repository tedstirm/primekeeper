class DogBreedsController < ApplicationController
  #layout 'session', only:[:index]
  layout 'session'
  load_and_authorize_resource
  before_action :set_dog_breed, only: [:show, :edit, :update, :destroy]

  # GET /dog_breeds
  # GET /dog_breeds.json
  def index
    @dog_breeds = DogBreed.all.includes(:dog_breed_group)
  end

  # GET /dog_breeds/1
  # GET /dog_breeds/1.json
  def show
  end

  # GET /dog_breeds/new
  def new
    @dog_breed = DogBreed.new
  end

  # GET /dog_breeds/1/edit
  def edit
  end

  # POST /dog_breeds
  # POST /dog_breeds.json
  def create
    @dog_breed = DogBreed.new(dog_breed_params)

    respond_to do |format|
      if @dog_breed.save
        format.html { redirect_to dog_breeds_url, notice: 'Dog breed was successfully created.' }
        format.json { render action: 'index', status: :created, location: @dog_breed }
      else
        format.html { render action: 'new' }
        format.json { render json: @dog_breed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dog_breeds/1
  # PATCH/PUT /dog_breeds/1.json
  def update
    respond_to do |format|
      if @dog_breed.update(dog_breed_params)
        format.html { redirect_to dog_breeds_url, notice: 'Dog breed was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dog_breed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dog_breeds/1
  # DELETE /dog_breeds/1.json
  def destroy
    @dog_breed.destroy
    respond_to do |format|
      format.html { redirect_to dog_breeds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog_breed
      @dog_breed = DogBreed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dog_breed_params
      params.require(:dog_breed).permit(:name, :dog_breed_group_id)
    end
end
