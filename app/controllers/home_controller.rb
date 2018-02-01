class HomeController < ApplicationController

  def index
    @users = User.all
    @scores = Rank.all
    @rank = Ranker.rank(@scores, :by => lambda { |sc| sc.score })
  end

  def history
    @history = Log.where(user_id: current_user)
  end

  def log
  end

end
