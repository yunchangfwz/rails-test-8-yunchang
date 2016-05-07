require 'rails_helper'

describe Brand, type: :model do
  context 'association' do
    it { is_expected.to have_many :shoes }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :name }
  end
end
