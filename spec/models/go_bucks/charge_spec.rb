require 'rails_helper'

module GoBucks
  RSpec.describe Charge, type: :model do
    let(:charge) { Charge.new(to_wallet: user_wallet) }
    let(:user_wallet) { create(:wallet, user: create(:user), balance: 20)}

    describe '#call' do
      subject { charge.call(10) }

      it "deducts amount" do
        expect { is_expected.to eq(true) }.to change(Transaction, :count).by(1)
        expect(user_wallet.reload).to have_attributes(balance: 10)
      end

      context 'with invalid amount' do
        subject { charge.call(30) }

        it "deducts nothing" do
          expect { is_expected.to eq(false) }.to_not change(Transaction, :count)
          expect(user_wallet.reload).to have_attributes(balance: 20)
        end
      end
    end
  end
end
