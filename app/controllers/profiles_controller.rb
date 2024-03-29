class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.prepare_profile
  end

  def update
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to profile_path, notice: 'updated!!'
    else
      flash.now[:error] = 'update failed...'
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(
      :avatar
    )
  end
end
