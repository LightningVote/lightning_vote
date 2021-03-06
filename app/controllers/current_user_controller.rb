class CurrentUserController < ApplicationController
  before_filter :ensure_logged_in

  def update
    current_user.update_attributes(user_params)
    redirect_to current_user_path
  end

  def edit
    @user = current_user
  end

  def show
    @user = current_user
    @events = current_user.events
  end

private
  def user_params
    params.require(:user).permit(user_detail_attributes: [:name]).tap do |whitelisted|
      whitelisted[:user_detail_attributes][:id] = current_user.id
    end
  end
end
