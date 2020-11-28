class HomeController < ApplicationController
  def index
    @buildings = Building.all
  end

  def create
    
  end
end
