require 'rails_helper'

module GoBucks
  RSpec.describe Transaction, type: :model do
    context 'associations' do
      it { is_expected.to belong_to(:to_wallet).class_name('GoBucks::Wallet') }
      it { is_expected.to belong_to(:from_wallet).class_name('GoBucks::Wallet').optional(true) }
    end
  end
end
