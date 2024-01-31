require 'rails_helper'

RSpec.describe "GoBucks Grant requests", type: :request do
  let(:user) { create(:user, email: "admin@example.com") }
  let!(:wallet) { create(:wallet, user: user) }

  before { sign_in user }

  describe "GET /grant" do
    subject { get '/go_bucks/grant' }
    let!(:other_wallet) { create(:wallet, user: create(:user)) }

    it "won't show current user wallet" do
      is_expected.to eq(200)
      expect(response.body).not_to include(wallet.user_name)
      expect(response.body).to include(other_wallet.user_name)
    end

    context 'user not admin' do
      let(:user) { create(:user) }
      it { is_expected.to eq(500) }
    end
  end
end
