module Botkick
	module Serializers

		module Button

			module Template

				class << self

					def import(node)
						template            = Botkick::Template.new 
						template.type       = :button
						template.title      = node["title"]
						template.buttons    = Serializers::Shared::Button.import_all(node["buttons"])
						template.serializer = self 
						return template
					end

					def export(data)
						buttons = Serializers::Shared::Button.export_all(data.buttons)
				    attachment = {
				      attachment: {
				        type:     "template",
				        payload: {
				          text:          data.title,
				          buttons:       buttons,
				          template_type: "button"
				        }
				      }
				    }
					end

				end

			end

		end
	end
end