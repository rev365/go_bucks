require 'rails_helper'

RSpec.describe "GoBucks Transactions requests", type: :request do
  let(:user) { create(:user) }

  before { sign_in user }

  describe "GET /transactions" do
    subject { get '/go_bucks/transactions' }
    let!(:wallet) { create(:wallet, user: user) }
    let!(:transaction) { create(:transaction, to_wallet: wallet, amount: 10) }

    it { is_expected.to eq(200) }
  end


  describe "POST /transactions" do
    subject { post '/go_bucks/transactions', params: { email: other_user.email, amount: 5 } }
    let!(:wallet) { create(:wallet, user: user, balance: 15) }
    let!(:other_user) { create(:user) }

    it "transfers amount" do
      expect { subject }.to change { GoBucks::Wallet.pluck(:balance) }.from([15]).to([10, 5])
    end
  end
end
