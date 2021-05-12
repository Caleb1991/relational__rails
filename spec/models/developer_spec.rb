require 'rails_helper'

RSpec.describe Developer, type: :model do
  describe 'relationships' do
    it { should have_many(:games)}
  end
end
