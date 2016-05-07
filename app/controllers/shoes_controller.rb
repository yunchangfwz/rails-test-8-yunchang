class ShoesController < ApplicationController

  def filter
    @search_filter = SearchFilter.new(search_params)
    @shoes = @search_filter.result
  end

  protected

  def search_params
    return nil if params[:search_filter].nil?

    params[:search_filter].permit(
                                 :min_price,
                                 :max_price,
                                 :brand_ids => []
                                 )
  end

end
