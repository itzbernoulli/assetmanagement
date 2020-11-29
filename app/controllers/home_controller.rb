class HomeController < ApplicationController
  def index
    @buildings = Building.order(created_at: :desc)
  end

  def buy
    VeryLongTaskJob.perform_later
    redirect_to root_path
  end
end
