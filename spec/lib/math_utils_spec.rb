require 'spec_helper'

describe IntercomTest::MathUtils do
  let(:extending_class) { Class.new { extend IntercomTest::MathUtils } }

  describe 'spherical_distance' do
    let!(:points) { [36.12, -86.67, 33.94, -118.4] }

    it 'returns the distance' do
      expect(extending_class.spherical_distance(*points).round(1)).to eq(2886.4)
    end
  end
end
