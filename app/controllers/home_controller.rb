class HomeController < ApplicationController

  def index
    @users = User.all
  end

  def history
    @history = Log.where(user_id: current_user)
  end

  def log
  end

end
