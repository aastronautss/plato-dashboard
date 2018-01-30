# frozen_string_literal: true

module MovesWrapper
  class Scrobble
    class InvalidActivityTypeError < StandardError; end

    T_MOVE = 'move'
    T_PLACE = 'place'
    T_OFF = 'off'

    PLACE_T_FACEBOOK = 'facebook'
    PLACE_T_FOURSQUARE = 'square'
    PLACE_T_DEFAULT = 'user'

    class << self
      def from_api(service, api_props = [])
        data = api_props.each_with_object([]) do |scrobble_day, scrobbles_params|
          next if scrobble_day.nil?

          scrobble_day.each do |activity|
            scrobbles_params << {
              external_service_id: service.id,
              scrobbled_at: activity['startTime'],

              data: data_for_activity(activity)
            }
          end
        end

        data.map { |params| LocationScrobble.new params }
      end

      private

      def data_for_activity(activity)
        case activity['type']
        when T_MOVE
          data_for_move(activity)
        when T_PLACE
          data_for_place(activity)
        when T_OFF
          {}
        else
          raise InvalidActivityTypeError
        end
      end

      def data_for_move(activity)
        {
          type: T_MOVE,
          begin_time: activity['startTime'],
          end_time: activity['endTime'],

          data_points: activity['activities'].map do |activity_h|
            {
              activity: activity_h['activity'],

              begin_time: activity_h['startTime'],
              end_time: activity_h['endTime'],

              duration: activity_h['duration'],
              distance: activity_h['distance'],

              coords: activity_h['trackPoints']
            }
          end
        }
      end

      def data_for_place(activity)
        {
          type: T_PLACE,
          begin_time: activity['startTime'],
          end_time: activity['endTime'],

          place_id: activity['place']['id'],
          place_name: activity['place']['name'],
          place_type: get_type_for_place(activity['place']),

          coords: activity['place']['location']
        }
      end

      def get_type_for_place(place_h)
        case place_h['type']
        when PLACE_T_FACEBOOK
          fetch_place_type_from_facebook(place_h['facebookPlaceId'])
        when PLACE_T_FOURSQUARE
          fetch_place_type_from_foursquare(place_h['foursquareId'])
        else
          place_h['type']
        end
      end

      def fetch_place_type_from_facebook(facebook_place_id)
        place_properties = Facebook.new.get_place facebook_place_id
        category = place_properties['category_list'].min_by { |category| category['id'].to_i }
        category['name']
      rescue Facebook::Adapter::InvalidPlaceError => e
        PLACE_T_DEFAULT
      end

      def fetch_place_type_from_foursquare(foursquare_place_id)
        place_properties = Foursquare.new.get_place foursquare_place_id
        place_properties['categories'].last['name']
      end
    end
  end
end
