require 'rails_helper'

RSpec.describe User do

  it 'validates information' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
  end
end
