module Serializers

	module Shared

		module Button

			class << self

				def import_all(buttons_data)
					buttons_data.map{|d| import(d)}
				end

				def export_all(buttons)
					buttons.map{|b| send(b.type, b)}
				end

				private

				def web_url(button)
			    {
			      type:  "web_url",
			      title: button.title,
			      webview_height_ratio: button.webview_height_ratio || "full",
			      messenger_extensions: true, 
			      url: button.url,
			      fallback_url: button[:fallback_url]
			    }
				end

				def postback(button)
			    {
			      type:    "postback",
			      title:   button.title,
			      payload: button.payload
			    } 
				end

				def import(data)
					button                       = Botkick::Button.new
					button.title                 = data["title"]
					button.payload               = data["payload"]
					button.type                  = data["type"]
					button.fallback_url          = data["fallback_url"]
					button.url                   = data["url"]
					button.webview_height_ratio  = data["webview_height_ratio"]
					button
				end
			end
		end

	end

end