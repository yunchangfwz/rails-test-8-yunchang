require 'rails_helper'

describe Shoe, type: :model do
  context 'association' do
    it { is_expected.to belong_to :brand }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :sku }
    it { should validate_numericality_of( :price ).is_greater_than(0) }
  end
end
