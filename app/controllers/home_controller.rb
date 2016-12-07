class HomeController < ApplicationController

  def home
    case
    when current_user.present?
      redirect_to dashboard_path
    else
      redirect_to new_user_path
    end
  end

end
