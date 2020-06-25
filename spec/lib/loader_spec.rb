require 'spec_helper'

describe IntercomTest::Loader do
  subject { IntercomTest::Loader.new(file) }
  let(:sample) do
    { "latitude": 53.343760, "user_id": 1, "name": 'Molly Malone', "longitude": -6.260947 }
  end

  let(:sample_hash) do
    { "latitude": "53.343760", "user_id": 1, "name": 'Molly Malone', "longitude": "-6.260947" }
  end

  describe 'hash_array' do
    context 'with a valid file' do
      let(:file) { File.expand_path(File.join(__dir__, '..', 'fixtures', 'customers.txt')) }

      it 'returns a hash with the information of the customer' do
        expect(subject.hash_array.size).to eq(2)
        expect(subject.hash_array).to include(sample_hash)
      end
    end

    context 'with an empty file' do
      let(:file) { File.expand_path(File.join(__dir__, '..', 'fixtures', 'empty.txt')) }

      it 'returns an empty list' do
        expect(subject.hash_array.size).to eq(0)
      end
    end

    context 'with an wrong file' do
      let(:file) { File.expand_path(File.join(__dir__, '..', 'fixtures', 'wrong.txt')) }

      it 'returns throw an hash_array' do
        expect { subject.customers.size }.to raise_error(JSON::ParserError)
      end
    end
  end

  describe 'customers' do
    context 'with a valid file' do
      let(:file) { File.expand_path(File.join(__dir__, '..', 'fixtures', 'customers.txt')) }

      it 'returns a hash with the information of the customer' do
        expect(subject.customers.size).to eq(2)
        expect(subject.customers.map(&:to_hash)).to include(sample)
      end
    end

    context 'with an empty file' do
      let(:file) { File.expand_path(File.join(__dir__, '..', 'fixtures', 'empty.txt')) }

      it 'returns an empty list' do
        expect(subject.customers.size).to eq(0)
      end
    end

    context 'with an wrong file' do
      let(:file) { File.expand_path(File.join(__dir__, '..', 'fixtures', 'wrong.txt')) }

      it 'returns throw an exception' do
        expect { subject.customers.size }.to raise_error(JSON::ParserError)
      end
    end
  end
end
