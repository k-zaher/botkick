require 'botkick/serializers/text/attachment'
require 'botkick/serializers/button/attachment'
require 'botkick/serializers/generic/attachment'
require 'botkick/serializers/generic/bucket'
require 'botkick/serializers/receipt/attachment'
require 'botkick/serializers/receipt/bucket'
require 'botkick/serializers/shared/button_bucket'

module Botkick
  # Serializer
  module Serializer
    def import(yml_nodes)
      templates = []
      yml_nodes.each do |node|
        mod_name = 'Botkick::Serializers::'\
        "#{node['template_type'].capitalize}::Attachment"
        mod = Object.const_get mod_name
        templates << mod.import(node)
      end
      templates
    end
  end
end
