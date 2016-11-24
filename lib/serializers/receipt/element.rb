module Serializers

	module Receipt

		module Element

			def export_all(elements)
				elements.each do |e|
					export(e)
				end
			end

			private

			def export(element)
		    {
		      title:     element[:title],
		      price:     element[:price],
		      quantity:  element[:quantity],
		      subtitle:  element[:subtitle],
		      currency:  element[:currency],
		      image_url: element[:image_url]
		    }
			end

		end

	end

end