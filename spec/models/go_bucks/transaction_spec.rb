require 'rails_helper'

module GoBucks
  RSpec.describe Transaction, type: :model do
    context 'associations' do
      it { is_expected.to belong_to(:to_wallet).class_name('GoBucks::Wallet') }
      it { is_expected.to belong_to(:from_wallet).class_name('GoBucks::Wallet').optional(true) }
    end

    context 'validation' do
      it { is_expected.to validate_presence_of(:amount) }
    end

    describe '::for_wallet' do
      let(:user) { create(:user) }
      let(:wallet) { create(:wallet, user: user) }
      let(:other_wallet) { create(:wallet, user: create(:user)) }
      let!(:received) { create(:transaction, to_wallet: wallet) }
      let!(:sent) { create(:transaction, to_wallet: other_wallet, from_wallet: wallet) }

      it { expect(Transaction.for_wallet(nil)).to be_none }
      it { expect(Transaction.for_wallet(wallet)).to include(received, sent) }
      it { expect(Transaction.for_wallet(other_wallet)).to_not include(received) }
    end
  end
end
