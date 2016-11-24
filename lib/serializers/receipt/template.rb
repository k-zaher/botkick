module Serializers

	module Receipt

		module Template

			def export(data)
				elements = Serializers::Receipt::Element.export_all(data[:elements])
		    {
		      attachment: {
		        type:     "template",
		        payload: {
		        	elements:       elements,
		        	currency:       data[:currency],
		          order_url:      data[:order_url],
		          timestamp:      data[:timestamp], 
		          order_number:   data[:order_number],
		          template_type:  "receipt",
		          recipient_name: data[:recipient_name],
		          payment_method: data[:payment_method],      
		          summary: {
		            subtotal:      data[:subtotal],
		            total_tax:     data[:total_tax],
		            total_cost:    data[:total_cost],
		            shipping_cost: data[:shipping_cost]
		          }
		        }
		      }
		    }
			end

		end

	end

end