require 'json'

module Botkick
  # Payload Parse Module
  module Payload
    class << self
      def parse(payload_string)
        parsed_payload = JSON.parse payload_string
        [parsed_payload['target_node'], parsed_payload['custom_data']]
      end
    end
  end
end
