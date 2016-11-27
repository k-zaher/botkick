require "serializers/text/template"
require "serializers/button/template"
require "serializers/generic/template"
require "serializers/generic/element"
require "serializers/receipt/template"
require "serializers/receipt/element"
require "serializers/shared/button"

module Serializers

	def import(yml_nodes)
		templates = []
		yml_nodes.each do |node|
			mod_name = "Serializers::#{node["template_type"].capitalize}::Template"
			mod = Object.const_get mod_name
			templates << mod.import(node)
		end
		templates
	end

end
