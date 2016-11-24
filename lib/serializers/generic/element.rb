module Serializers

	module Generic

		module Element

			def export_all(elements)
				elements.each do |e|
					export(e)
				end
			end

			private

			def export(element)
				buttons = Serializers::Shared::Button.export_all(element[:buttons])
		    attachment =     {
		      title:      element[:title],
		      buttons:    buttons,
		      subtitle:   element[:subtitle],
		      image_url:  element[:image_url],
		    }
			end

		end

	end

end