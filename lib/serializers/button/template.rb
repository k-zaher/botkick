module Serializers

	module Button

		module Template

			def export(data)
				buttons = Serializers::Shared::Button.export_all(data[:buttons])
		    attachment = {
		      attachment: {
		        type:     "template",
		        payload: {
		          text:          data[:title],
		          buttons:       buttons,
		          template_type: "button"
		        }
		      }
		    }
			end

		end

	end

end