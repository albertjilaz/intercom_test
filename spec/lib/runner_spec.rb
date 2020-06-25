require 'spec_helper'

describe IntercomTest::Runner do

  before(:each) do
    ARGV.clear
  end


  let(:file) { File.expand_path(File.join(__dir__, '..', 'fixtures', 'customers.txt')) }
  let(:wrong_file) { File.expand_path(File.join(__dir__, '..', 'fixtures', 'wrong.txt')) }

  subject { IntercomTest::Runner.new }

  let(:expected_output) do
    customers = IntercomTest::Loader.new(file).customers
    customers.sort_by(&:user_id).map(&:to_json).join("\n") + "\n\n"
  end

  let(:help_message) do
    %(
Usage: intercom_test [options]
    -f, --file [FILE]                Specify the route to a file with a list of customers in JSON format (each row is a customer)
    -r, --radius [RADIUS]            Indicate the distance from Intercom offices which customers should be within, must be a valid number (default 100.0)
    -h, --help                       Prints this help
    )
  end

  describe 'run' do
    context 'with right parameters' do
      before do
        ARGV[0] = '-f'
        ARGV[1] = file
      end

      it 'returns the expected output' do
        expect { subject.run }.to output(expected_output).to_stdout
      end
    end

    context 'with wrong file route' do
      before do
        ARGV[0] = '-f'
        ARGV[1] = 'no_file'
      end

      it 'shows an error message' do
        expect { subject.run }.to output(/Cannot read no_file/).to_stdout
      end
    end

    context 'with an invalid file' do
      before do
        ARGV[0] = '-f'
        ARGV[1] = wrong_file
      end

      it 'shows an error message' do
        expect { subject.run }.to output(/File .* has an invalid format/).to_stdout
      end
    end

    context 'with an invalid option' do
      before do
        ARGV[0] = '-x'
      end

      it 'shows an error message' do
        expect { subject.run }.to output(/Invalid option/).to_stdout
      end
    end

    context 'with invalid radius' do
      before do
        ARGV[0] = '-r'
        ARGV[1] = 'no_number'
      end

      it 'shows an error message' do
        expect { subject.run }.to output(/Invalid parameters/).to_stdout
      end
    end

    context 'with -h parameters' do
      before do
        ARGV[0] = '-h'
      end

      it 'shows the help' do
        expect { subject.run }.to output(help_message).to_stdout
      end
    end
  end
end
