class ProfilesController < ApplicationController
  before_action :user_signed_in?

  def new
    @profile = Profile.new
  end

  def index
    @profiles = Profile.all
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save!
      flash[:notice] = "Profile successfully created"
      redirect_to @profile
    else
      render 'new'
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])

    if @profile.update_attribute(profile_params)
      redirect_to profile_path
      flash[:success] = "profile updated"
    else
      render 'edit'
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    flash[:success] = "profile destroyed"
  end

  private

  def profile_params
    params.require(:profile).permit(:bio, :avatar)
  end
end
