module Serializers

	module Generic

		module Template

			class << self

				def import(node)
					template            = Botkick::Template.new 
					template.type       = :generic
					template.elements   = Serializers::Generic::Element.import_all(node["elements"])
					template.serializer = self
					return template
				end

				def export(template)
					elements = Serializers::Generic::Element.export_all(template.elements)
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

end