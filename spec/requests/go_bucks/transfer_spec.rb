require 'rails_helper'

RSpec.describe "GoBucks Transfer requests", type: :request do
  let(:user) { create(:user) }

  before { sign_in user }

  describe "GET /transfer" do
    subject { get '/go_bucks/transfer' }
    it  { is_expected.to eq(200) }
  end

  describe "POST /transfer" do
    subject { post '/go_bucks/transfer', params: { email: other_user.email, amount: 5 } }
    let!(:wallet) { create(:wallet, user: user, balance: 15) }
    let!(:other_user) { create(:user) }

    it "transfers amount" do
      expect { subject }.to change { GoBucks::Wallet.pluck(:balance) }.from([15]).to([10, 5])
      expect(response).to redirect_to '/go_bucks/wallet/transactions'
    end

    context "invalid amount" do
      let!(:wallet) { create(:wallet, user: user, balance: 1) }

      it "won't transfer" do
        is_expected.to eq(422)
        expect(GoBucks::Wallet.pluck(:balance) ).to eq [1, 0]
        expect(response).to render_template('show')
      end
    end
  end
end