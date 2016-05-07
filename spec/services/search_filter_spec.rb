require 'rails_helper'

describe SearchFilter do
  describe '#result' do
    let!(:nice)    { create(:brand) }
    let!(:shoe)    { create(:shoe, brand: nice) }

    it 'returns a list of shoes' do
      result = SearchFilter.new(brand_ids: [nice.id], order_by: 'asc').result
      expect(result).to include shoe
    end
  end
end
