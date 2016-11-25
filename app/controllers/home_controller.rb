class HomeController < ApplicationController
  before_action :authenticate_user, except: [:index]

  def index
    @user = User.new
  end



  private



end
