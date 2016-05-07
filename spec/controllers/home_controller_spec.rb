require 'rails_helper'

describe HomeController, type: :controller do
  describe "#index" do
    def do_request
      get :index
    end
    let!(:brands)      { create_list(:brand, 3)}

    it "displays video request form" do
      do_request
      expect(assigns(:brands)).to eq brands
    end
  end
end