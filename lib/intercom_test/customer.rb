# frozen_string_literal: true

require 'intercom_test/math_utils'

module IntercomTest
  # Class to hold Customer data.
  class Customer
    include IntercomTest::MathUtils

    DEGREE_RADIAN_RATIO = Math::PI / 180

    attr_accessor :user_id, :latitude, :longitude, :name

    def initialize(user_id: nil, latitude: nil, longitude: nil, name: nil)
      @user_id    = user_id
      @latitude   = latitude.to_f
      @longitude  = longitude.to_f
      @name       = name
    end

    # Calculate the distance between the customer and the given point
    def distance_to(lat = 0.0, long = 0.0)
      spherical_distance(lat, long, @latitude, @longitude)
    end

    def to_hash
      {
        user_id: @user_id,
        latitude: @latitude,
        longitude: @longitude,
        name: @name
      }
    end

    alias to_h to_hash

    def as_json(_options = nil)
      to_hash
    end

    def to_json(options = nil)
      as_json(options).to_json
    end
  end
end
