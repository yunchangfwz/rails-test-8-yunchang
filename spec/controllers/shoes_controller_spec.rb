require 'rails_helper'

describe ShoesController, type: :controller do
  describe "#filter" do
    def do_request
      get :filter, search_filter: search_params, format: :js
    end

    let!(:nice)              { create(:brand) }
    let!(:puma)              { create(:brand) }
    let!(:nice_shoe)         { create(:shoe, name: 'Nice', price: 10, brand: nice)}
    let!(:nice_beauty_shoe)  { create(:shoe, name: 'Beauty', price: 10, brand: nice)}
    let!(:puma_shoe)         { create(:shoe, brand: puma)}

    let!(:search_params) { { :brand_ids => [nice.id], min_price: 0, max_price: 20, order_by: 'asc'} }

    it 'return result' do
      do_request

      expect(assigns(:shoes).size).to eq 2
      expect(assigns(:shoes)).to include nice_shoe
      expect(assigns(:shoes)).to include nice_beauty_shoe
      expect(assigns(:shoes).first).to match nice_beauty_shoe
      expect(assigns(:shoes)).not_to include puma_shoe
    end
  end
end
