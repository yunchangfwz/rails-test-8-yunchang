class HomeController < ApplicationController
  def index
    @brands = Brand.all
    @shoes = Shoe.all
  end
end