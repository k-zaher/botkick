require 'json'

module Botkick
	module Payload

		class << self

			def parse(payload_string)
				parsed_payload = JSON.parse payload_string
				return payload['target_node'], payload['custom_data']
			end
		end

	end

end