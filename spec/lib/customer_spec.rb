require 'spec_helper'

describe IntercomTest::Customer do
  let(:data_hash) do
    {
      user_id: 1,
      latitude: 53.343760,
      longitude: -6.260947,
      name: 'Molly Malone'
    }
  end
  subject { IntercomTest::Customer.new(data_hash) }

  describe 'to_hash' do
    it 'returns a hash with the information of the customer' do
      expect(subject.to_hash).to eq(data_hash)
    end
  end

  describe 'to_json' do
    it 'returns a json with the information of the customer' do
      expect(subject.to_json).to eq(data_hash.to_json)
    end
  end

  describe 'distance_to' do
    it 'invokes module function IntercomTest::MathUtils.spherical_distance' do
      expect_any_instance_of(IntercomTest::MathUtils).to receive(:spherical_distance)
      subject.distance_to(0, 0)
    end
  end
end
