class ShoesController < ApplicationController
  protect_from_forgery except: :filter
  
  def filter
    @search_filter = SearchFilter.new(search_params)
    result = @search_filter.result
    @shoes = result.paginate(page: params['page'], per_page: 12)
  end

  protected

  def search_params
    return nil if params[:search_filter].nil?

    params[:search_filter].permit(
                                 :min_price,
                                 :max_price,
                                 :order_by,
                                 :brand_ids => []
                                 )
  end

end
