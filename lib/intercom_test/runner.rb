# frozen_string_literal: true

require 'optparse'

module IntercomTest
  # Class that provides the entry point to run the algorythm
  class Runner
    DUBLIN_OFFICE = [53.339428, -6.257664].freeze
    #
    # Starts the program.
    #
    def run
      error_handler do
        init_default_options
        parser.parse!

        customers = Loader.new(@file).customers
        customers.select { |customer| customer.distance_to(*DUBLIN_OFFICE) < @radius }
                 .sort_by(&:user_id)
                 .each { |customer| puts customer.to_json }
        # Just insert a final line
        puts ''
      end
    end

    private

    # rubocop:disable Metrics/MethodLength

    # Show error messages
    def error_handler
      yield
    rescue ArgumentError, TypeError => _e
      puts "\nInvalid parameters\n\n"
      puts parser
    rescue JSON::ParserError => _e
      puts "\nFile #{@file} has an invalid format\n\n"
      puts parser
    rescue Errno::ENOENT => _e
      puts "\nCannot read #{@file}\n\n"
      puts parser
    rescue OptionParser::InvalidOption => e
      puts "\n#{e.message.capitalize}\n\n"
      puts parser
    end
    # rubocop:enable Metrics/MethodLength

    # Set default values in case they are not provided through the command line.
    def init_default_options
      @file = File.expand_path('../../data/customers.txt', __dir__)
      @radius = 100.0
    end

    # Option parser
    def parser
      @parser ||= OptionParser.new do |opt_parser|
        opt_parser.on('-f', '--file [FILE]', String, 'Specify the route to a file with a list of customers ' \
          'in JSON format (each row is a customer)') do |file|
          @file = file
        end
        opt_parser.on('-r', '--radius [RADIUS]', Float, 'Indicate the distance from Intercom offices which customers ' \
          'should be within, must be a valid number (default 100.0)') do |radius|
          @radius = Float(radius)
        end
        opt_parser.on('-h', '--help', 'Prints this help') do
          puts opt_parser
          exit
        end
      end
    end
  end
end
