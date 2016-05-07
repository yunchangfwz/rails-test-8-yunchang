require 'rails_helper'

describe HomeController, type: :controller do
  describe "#index" do
    def do_request
      get :index
    end

    it "displays video request form" do
      do_request
      expect(assigns(:test)).to eq 1
    end
  end
end