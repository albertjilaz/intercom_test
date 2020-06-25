# frozen_string_literal: true

module IntercomTest
  # Module where Math functions are implemented
  module MathUtils
    include Math
    DEGREE_RADIAN_RATIO = Math::PI / 180
    RADIUS = 6371

    # rubocop:disable Metrics/AbcSize

    # Haversine formula to calculate the orthodromic distance between two
    # geographical points.
    # See: https://en.wikipedia.org/wiki/Great-circle_distance#Computational_formulas
    # @lat1, @long1 [Float] latitude and longitude of the first point
    # @lat2, @long2 [Float] latitude and longitude of the second point
    # @return [Float] distance in kilometers from the first point to the second.
    def spherical_distance(lat1, long1, lat2, long2)
      delta_lat = (lat2 - lat1) * DEGREE_RADIAN_RATIO
      delta_lon = (long2 - long1) * DEGREE_RADIAN_RATIO

      delta_sigma = 2 * asin(sqrt(sin(delta_lat / 2)**2 +
                                  cos(lat1 * DEGREE_RADIAN_RATIO) *
                                    cos(lat2 * DEGREE_RADIAN_RATIO) *
                                  sin(delta_lon / 2)**2))
      delta_sigma * RADIUS
    end
    # rubocop:enable Metrics/AbcSize
  end
end
