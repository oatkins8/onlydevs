class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update destroy]
  before_action :set_profile, only: %i[show edit update destroy]

  # GET /profiles
  def index
    @profiles = Profile.all
    params.delete_if { |key, _| params[key] == 'Any'}
    @profiles = Profile.filter(params.slice(:discipline, :work_experience))

    if params[:city].present?
      near = Profile.near(params[:city], params[:radius].to_i, units: :km)
      @profiles = @profiles.select { |profile| near.include?(profile) }
    end
    # @markers = @profiles.geocoded.map do |profile|
    #   {
    #     lat: profile.latitude,
    #     lng: profile.longitude
    #   }
    # end
  end

  # GET /profiles/1
  def show
    @profile = Profile.find(params[:id])
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit; end

  # POST /profiles
  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      redirect_to @profile, notice: 'Profile was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /profiles/1
  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile.destroy
    redirect_to profiles_url, notice: 'Profile was successfully destroyed.', status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = Profile.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def profile_params
    params.require(:profile).permit(:name, :city, :work_experience, :discipline,
                                    :answer_one, :answer_two, :answer_three, :answer_four, :answer_five, :user_id, :avatar, tech_stack: [])
  end
end
