class Brand < ActiveRecord::Base
  has_many  :shoes

  validates :name,         presence: true 
end
