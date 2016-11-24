module Serializers

	module Shared

		module Button

			def export_all(buttons)
				buttons.each do |b|
					b[:type] == "postback" ? export_post_back(b) : export_web(b)
				end
			end

			private

			def export_web(button)
		    {
		      type:  "web_url",
		      title: button[:title],
		      webview_height_ratio: button[:height] || "full",
		      messenger_extensions: true, 
		      url: button[:url],
		      fallback_url: button[:fallback_url]
		    }
			end

			def export_post_back(button)
		    {
		      type:    "postback",
		      title:   button[:title],
		      payload: button[:payload]
		    } 
			end

		end

	end

end