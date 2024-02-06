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

  describe "GET /wallet/transactions" do
    subject { get '/go_bucks/wallet/transactions' }
    let!(:wallet) { create(:wallet, user: user) }
    let!(:transaction) { create(:transaction, to_wallet: wallet, amount: 10) }

    it "lists wallet transactions" do 
      is_expected.to eq(200)
      expect(response.body).to include(user.name, user.email, '10')
    end
  end
end
