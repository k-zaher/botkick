module Serializers

	module Generic

		module Template

			def export(data)
				elements = Serializers::Generic::Element.export_all(data[:elements])
		    {
		    	attachment: {
		      	type:     "template",
		      	payload: {
		      		elements:      elements,   
		        	template_type: "generic"
		      	}
		    	}
		  	}
			end

		end

	end

end