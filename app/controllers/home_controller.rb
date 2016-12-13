class HomeController < ApplicationController


  def index
    render action: 'index', layout: 'onboarding'
  end

  def home
    case
    when current_user.present?
      redirect_to dashboard_path
    else
      redirect_to home_index_path
    end
  end

end
