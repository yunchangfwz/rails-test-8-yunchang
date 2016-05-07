require 'rails_helper'

describe ShoesController, type: :controller do
  describe "#filter" do
    def do_request
      get :filter, search_filter: search_params, format: :js
    end

    let!(:nice)          { create(:brand) }
    let!(:puma)          { create(:brand) }
    let!(:nice_shoe)     { create(:shoe, price: 10, brand: nice)}
    let!(:puma_shoe)     { create(:shoe, brand: puma)}

    let!(:search_params) { { :brand_ids => [nice.id], min_price: 0, max_price: 20} }

    it 'return result' do
      do_request

      expect(assigns(:shoes).size).to eq 1
      expect(assigns(:shoes)).to include nice_shoe
      expect(assigns(:shoes)).not_to include puma_shoe
    end
  end
end
