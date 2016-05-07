class SearchFilter

  include ActiveModel::Conversion
  extend  ActiveModel::Naming

  attr_accessor :brand_ids
  attr_accessor :min_price
  attr_accessor :max_price
  attr_accessor :order_by

  def initialize(option)
    return if option.nil?
    @brand_ids  = option[:brand_ids]
    @min_price  = option[:min_price]
    @max_price  = option[:max_price]
    @order_by  = option[:order_by]
  end

  def result
    result = Shoe.all
    result = result.find_by_brands(brand_ids)  if brand_ids.present? and brand_ids.any? &:present?
    result = result.find_by_min_price(min_price.to_f) if min_price.present?
    result = result.find_by_max_price(max_price.to_f) if max_price.present?
    result = result.order(name: order_by)
    result = result.limit(12)
    result
  end

  def persisted?
    false
  end
end