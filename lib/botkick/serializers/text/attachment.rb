module Botkick
  module Serializers
    module Text
      # Messenger Text Template
      module Attachment
        class << self
          def import(node)
            template         = Template.new
            template.type    = :text
            template.title   = node['title']
            template.serializer = self
            template
          end

          def export(data)
            {
              text: data.title
            }
          end
        end
      end
    end
  end
end
