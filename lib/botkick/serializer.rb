require "botkick/serializers/text/template"
require "botkick/serializers/button/template"
require "botkick/serializers/generic/template"
require "botkick/serializers/generic/element"
require "botkick/serializers/receipt/template"
require "botkick/serializers/receipt/element"
require "botkick/serializers/shared/button"

module Botkick
  module Serializer
  	def import(yml_nodes)
  		templates = []
  		yml_nodes.each do |node|
  			mod_name = "Botkick::Serializers::#{node["template_type"].capitalize}::Template"
  			mod = Object.const_get mod_name
  			templates << mod.import(node)
  		end
  		templates
  	end
  end
end
