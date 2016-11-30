class UsersController < ApplicationController


  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path, notice: "Logged In!"
    else
      render :new
    end
  end

  # def destroy
  #   User.find(params[:id]).destroy
  #   flash[:success] = "User deleted"
  #   redirect_to root_path
  # end

  def dashboard
    if user_signed_in?
      @user = User.find(session[:user_id])
    else
      redirect_to root_path
    end
    @auction = Auction.new
    @auctions = @user.auctions
  end

  private

  def user_params
    params.require(:user).permit( :first_name,
                                  :last_name,
                                  :email,
                                  :password,
                                  :password_confirmation
                                  )
  end

end
