require 'rails_helper'

RSpec.describe "GoBucks Charge requests", type: :request do
  let!(:user) { create(:user, email: "admin@example.com") }
  let!(:walletless) { create(:user, email: "iam@walletless.com") }
  let!(:wallet) { create(:wallet, user: user) }
  let!(:other_wallet) { create(:wallet, user: create(:user), balance: 10) }
  let!(:zero_balanced_wallet) { create(:wallet, user: create(:user), balance: 0) }

  before { sign_in user }

  describe "GET /charge" do
    subject { get '/go_bucks/charge' }

    it "won't show current user wallet and walletless user" do
      is_expected.to eq(200)
      expect(response.body).to_not include(wallet.user_name)
      expect(response.body).to_not include(walletless.name)
      expect(response.body).to_not include(zero_balanced_wallet.user_name)
      expect(response.body).to include(other_wallet.user_name)
    end

    context 'user not admin' do
      let(:user) { create(:user) }
      it { is_expected.to eq(500) }
    end
  end

  describe "POST /charge" do
    subject { post '/go_bucks/charge', params: { ids: ids + [user.id], amount: 5 } }
    let(:ids) { [other_wallet.user_id, walletless.id] }

    it "deducts user wallets" do
      expect { subject }.to change { GoBucks::Wallet.pluck(:balance) }.from([0, 10, 0]).to([0, 5, 0])
    end

    context 'with invalid amount' do
      subject { post '/go_bucks/charge', params: { ids: [other_wallet.user_id], amount: 100 } }

      it 'fails charge' do
        expect { subject }.to_not change { GoBucks::Wallet.pluck(:balance) }
        is_expected.to eq(302)
      end
    end
  end
end
