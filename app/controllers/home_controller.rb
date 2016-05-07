class HomeController < ApplicationController
  def index
    @shoe = Shoe.all
  end
end