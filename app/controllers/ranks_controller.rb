class LogsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_log, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @rank = Rank.new
  end

  def create
  end

  def edit
  end

  def update

  end


  private

  def find_log
    @rank = Rank.find(params[:id])
  end

  def rank_params
    params.require(:rank).permit(:score)
  end

end
