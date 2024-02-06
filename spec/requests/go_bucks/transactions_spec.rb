require 'rails_helper'

RSpec.describe "GoBucks Transactions requests", type: :request do
  let!(:user) { create(:user, email: "admin@example.com") }

  before { sign_in user }

  describe "GET /transactions" do
    subject { get '/go_bucks/transactions' }
    let!(:wallet) { create(:wallet, user: user) }
    let!(:transaction) { create(:transaction, to_wallet: wallet, amount: 10) }

    it { is_expected.to eq(200) }
  end
end
