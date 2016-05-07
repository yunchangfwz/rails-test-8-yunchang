class Shoe < ActiveRecord::Base
  belongs_to :brand
   
  validates :name,         presence: true 
  validates :sku,          presence: true
  validates :price,        presence: true, numericality: { greater_than: 0 } 

  has_attached_file :image, styles: { medium: "260x260>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


  def self.find_by_brands(brand_ids)
    where(brand_id: brand_ids)
  end

  def self.find_by_min_and_max_price(min_price, max_price)
    where("price >= ? and price <= ?", min_price, max_price )
  end

  def self.find_by_min_price(min_price)
    where("price >= ?", min_price )
  end

  def self.find_by_max_price(max_price)
    where("price <= ?", max_price )
  end
end
