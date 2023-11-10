require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }
  it { expect(subject.name).to eq subject.email }
end
