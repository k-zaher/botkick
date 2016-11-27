module Serializers

	module Receipt

		module Template

			class << self

				def import(node)
					template            = Botkick::Template.new 
					template.type       = :receipt
					template.data       = node["data"]
					template.elements   = Serializers::Generic::Element.import_all(node["elements"])
					template.serializer = self 
					return template
				end

				def export(template)
					elements = Serializers::Receipt::Element.export_all(template.elements)
			    {
			      attachment: {
			        type:     "template",
			        payload: {
			        	elements:       elements,
			        	currency:       template.data["currency"],
			          order_url:      template.data["order_url"],
			          timestamp:      template.data["timestamp"], 
			          order_number:   template.data["order_number"],
			          template_type:  "receipt",
			          recipient_name: template.data["recipient_name"],
			          payment_method: template.data["payment_method"],      
			          summary: {
			            subtotal:      template.data["subtotal"],
			            total_tax:     template.data["total_tax"],
			            total_cost:    template.data["total_cost"],
			            shipping_cost: template.data["shipping_cost"]
			          }
			        }
			      }
			    }
				end

			end
			
		end

	end

end