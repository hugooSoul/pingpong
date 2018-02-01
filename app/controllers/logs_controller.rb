class LogsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_log, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @log = current_user.logs.build
  end

  def create
    @log = current_user.logs.build(log_params)

    if @log.save
      Rank.set_values(current_user.id, @log.oponent, @log.my_score, @log.their_score)
      redirect_to @log
    else
      flash[:error] = @log.errors
      render :action => 'new'
    end
  end


  private

  def find_log
    @log = Log.find(params[:id])
  end

  def log_params
    params.require(:log).permit(:date, :oponent, :my_score, :their_score)
  end

end
