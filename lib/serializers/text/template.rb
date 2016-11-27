module Serializers

	module Text

		module Template

			class << self

				def import(node)
					template         = Botkick::Template.new 
					template.type    = :text
					template.title   = node["title"]
					return template
				end

				def export(data)
			    { 
			      text: data[:title]
			    }
				end
				
			end
			
		end

	end

end