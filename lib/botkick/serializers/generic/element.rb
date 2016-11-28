module Botkick
	module Serializers

		module Generic

			module Element

				class << self

					def import_all(elements_data)
						elements_data.map{|e| import(e)}
					end

					def export_all(elements)
						elements.map{|e| export(e) }
					end

					private

					def export(element)
						buttons = Serializers::Shared::Button.export_all(element.buttons)
				    attachment =     {
				      title:      element.title,
				      buttons:    buttons,
				      subtitle:   element.subtitle,
				      image_url:  element.image_url,
				    }
					end

					def import(data)
						element           = Botkick::Element.new
						element.title     = data["title"]
						element.subtitle  = data["subtitle"]
						element.image_url = data["image_url"]
						element.buttons   = Serializers::Shared::Button.import_all(data["buttons"])
						element
					end

				end

			end

		end
	end
end