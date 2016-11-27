module Serializers

	module Receipt

		module Element

			class << self

				def import_all(elements)
					elements.map {|e| import(e)}
				end

				def export_all(elements)
					elements.map {|e| export(e)}
				end

				private

				def export(element)
			    {
			      title:     element.data["title"],
			      price:     element.data["price"],
			      quantity:  element.data["quantity"],
			      subtitle:  element.data["subtitle"],
			      currency:  element.data["currency"],
			      image_url: element.data["image_url"]
			    }
				end

				def import(element_data)
					element      = Botkick::Element.new 
			    element.data = element_data["data"]
			    element
				end
			end
		end

	end

end