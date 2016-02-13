class DashbordController < ApplicationController
  def index
    @athletes = User.all
  end
end
