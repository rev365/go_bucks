require 'rails_helper'

RSpec.describe "GoBucks Wallet requests", type: :request do
  let(:user) { create(:user) }

  before { sign_in user }

  describe "GET /wallet" do
    subject { get '/go_bucks/wallet' }
    let!(:wallet) { create(:wallet, user: user) }

    it { is_expected.to eq(200) }
  end

  describe "POST /wallet" do
    subject { post '/go_bucks/wallet' }

    it { is_expected.to eq(302) }
  end
end
