class LogsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_log, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @log = Log.new
  end

  def create
    @log = current_user.logs.new(log_params)

    if @log.save
      redirect_to @log
    else
      flash[:error] = @log.errors
      render :action => 'new'
    end
  end

  def edit
  end

  def update
  end

  def delete
  end


  private

  def find_log
    @log = Log.find(params[:id])
  end

  def log_params
    params.require(:log).permit(:date, :oponent, :my_score, :their_score)
  end

end
