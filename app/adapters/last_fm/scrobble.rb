# frozen_string_literal: true

module LastFm
  class Scrobble
    class << self
      def from_api(service, api_props = {})
        api_props = api_props.with_indifferent_access
        scrobbled_at = Time.at(api_props[:date][:uts].to_i)

        params = {
          external_service_id: service.id,
          scrobbled_at: scrobbled_at,

          data: {
            id: api_props[:mbid].is_a?(String) ? api_props[:mbid] : '',
            name: api_props[:name],

            url: api_props[:url] || '',
            image_url: api_props[:image][-1][:content] || '',
            image_thumbnail_url: api_props[:image][1][:content] || api_props[:image][0][:content] || '',

            artist: { id: api_props[:artist][:mbid] || '', name: api_props[:artist][:content] || '' },
            album: { id: api_props[:album][:mbid] || '', name: api_props[:album][:content] || '' },
          }.to_json
        }

        MusicScrobble.new params
      end
    end
  end
end
