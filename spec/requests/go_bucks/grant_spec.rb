require 'rails_helper'

RSpec.describe "GoBucks Grant requests", type: :request do
  let!(:user) { create(:user, email: "admin@example.com") }
  let!(:walletless) { create(:user) }
  let!(:wallet) { create(:wallet, user: user) }
  let!(:other_wallet) { create(:wallet, user: create(:user)) }

  before { sign_in user }

  describe "GET /grant" do
    subject { get '/go_bucks/grant' }

    it "won't show current user wallet" do
      is_expected.to eq(200)
      expect(response.body).not_to include(wallet.user_name)
      expect(response.body).to include(other_wallet.user_name, walletless.name)
    end

    context 'user not admin' do
      let(:user) { create(:user) }
      it { is_expected.to eq(500) }
    end
  end

  describe "POST /grant" do
    subject { post '/go_bucks/grant', params: { ids: ids + [user.id], amount: 5 } }
    let(:ids) { [other_wallet.user_id, walletless.id] }

    it "funds user wallets" do
      expect { subject }.to change { GoBucks::Wallet.pluck(:balance) }.from([0, 0]).to([0, 5, 5])
    end
  end
end
