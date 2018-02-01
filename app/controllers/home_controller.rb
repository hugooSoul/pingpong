class HomeController < ApplicationController

  def index
  end

  def history
    @history = Log.all
  end

  def log
  end
  
end
