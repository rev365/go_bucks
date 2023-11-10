require 'rails_helper'

module GoBucks
  RSpec.describe Wallet, type: :model do
    subject(:wallet) { Wallet.create(balance: balance, user: create(:user)) }
    let(:balance) { 0 }

    describe '#update' do
      it { expect { wallet.update(balance: 1000) }.to_not change { wallet.reload.balance } }
    end

    describe '#deposit' do
      it { expect { wallet.deposit(10) }.to change(wallet, :balance).by(10) }

      it 'handles race condition' do
        conns = concurrently { wallet.deposit(1000) }
        expect(wallet.reload.balance).to eq(conns * 1000)
      end

      context 'negative amount' do
        it { expect { wallet.deposit(-10) }.to raise_error(InvalidAmount) }
      end
    end

    describe '#withdraw' do
      let(:balance) { 5000 }

      it { expect { wallet.withdraw(1000) }.to change(wallet, :balance).to(4000) }

      it 'handles race condition' do
        conns = concurrently { wallet.withdraw(1000) }
        expect(wallet.reload.balance).to eq balance - (conns * 1000)
      end

      context 'greater than balance' do
        it { expect { wallet.withdraw(balance.next) }.to raise_error(InvalidAmount, "Not enough balance.") }
      end
    end
  end
end
