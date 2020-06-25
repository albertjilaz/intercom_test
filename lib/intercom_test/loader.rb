# frozen_string_literal: true

require 'json'

module IntercomTest
  # Responsible for loading the files into an array of customers
  class Loader
    # @file route to the file containing the customer data in JSON format (each file a customer)
    def initialize(file)
      @file = file
    end

    # Return file content as an array of Customer objects
    def customers
      hash_array.map { |hash| Customer.new(hash) }
    end

    # Return file content as an array of hashes
    def hash_array
      File.readlines(@file).map do |row|
        JSON.parse(row).inject({}) { |hash, pair| hash.merge(pair[0].to_sym => pair[1]) }
      end
    end
  end
end
