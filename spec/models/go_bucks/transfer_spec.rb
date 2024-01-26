require 'rails_helper'

module GoBucks
  RSpec.describe Transfer, type: :model do
    let(:transfer) { Transfer.to(recipient, from: user) }
    let(:recipient) { create(:user, email: 'janedoe@example.com') }
    let(:user) { create(:user) }

    describe '#call' do
      subject { transfer.call(10) }
      let!(:user_wallet) { create(:wallet, user: user, balance: 10) }
      let!(:recipient_wallet) { create(:wallet, user: recipient, balance: 10) }

      it "transfers amount" do
        expect { is_expected.to eq(true) }.to change(Transaction, :count).by(1)
        expect(user_wallet.reload).to have_attributes(balance: 0)
        expect(recipient_wallet.reload).to have_attributes(balance: 20)
      end

      context 'with invalid amount' do
        subject { transfer.call(-10) }

        it "transfers nothing" do
          expect { is_expected.to eq(false) }.to_not change(Transaction, :count)
          expect(user_wallet.reload).to have_attributes(balance: 10)
          expect(recipient_wallet.reload).to have_attributes(balance: 10)
        end
      end
    end
  end
end
