module Serializers

	module Text

		module Template

			def export(data)
		    { 
		      text: data[:title]
		    }
			end
			
		end

	end

end