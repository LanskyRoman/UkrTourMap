require 'rails_helper'

describe Poi, type: :model do
  it { expect(build(:poi)).to be_valid }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_most(255) }

  it { is_expected.to validate_presence_of(:description) }

  it { is_expected.to validate_presence_of(:lonlat) }
end
