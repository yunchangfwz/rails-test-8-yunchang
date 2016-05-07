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

  describe '#find_by_brands(brand_ids)' do
    let!(:nice)           { create(:brand) }
    let!(:puma)           { create(:brand) }
    let!(:nice_shoe)      { create(:shoe, brand: nice) }
    let!(:another_shoe)   { create(:shoe) }

    it 'should includes shoe_nice' do
      expect(Shoe.find_by_brands([nice.id, puma.id])).to include nice_shoe
      expect(Shoe.find_by_brands([nice.id, puma.id])).not_to include another_shoe
    end
  end

  describe '#find_by_min_price(min_price)' do
    let!(:nice_shoe)   { create(:shoe, price: 10) }
    let!(:puma_shoe)   { create(:shoe, price: 20) }

    it 'should includes shoe_nice' do
      expect(Shoe.find_by_min_price(10)).to include nice_shoe
      expect(Shoe.find_by_min_price(15)).to include puma_shoe
      expect(Shoe.find_by_min_price(15)).not_to include nice_shoe
    end
  end

  describe '#find_by_max_price(min_price)' do
    let!(:nice_shoe)   { create(:shoe, price: 20) }
    let!(:puma_shoe)   { create(:shoe, price: 60) }

    it 'should includes shoe_nice' do
      expect(Shoe.find_by_max_price(40)).to include nice_shoe
      expect(Shoe.find_by_max_price(40)).not_to include puma_shoe
      expect(Shoe.find_by_max_price(80)).to include puma_shoe
    end
  end
end
