module Botkick
  module Serializers
    module Generic
      # Messener Generic Template Module
      module Attachment
        class << self
          def import(node)
            template            = Template.new
            template.type       = :generic
            template.elements   = Serializers::Generic::Bucket
                                  .import_all(node['elements'])
            template.serializer = self
            template
          end

          def export(template)
            elements = Serializers::Generic::Bucket
                       .export_all(template.elements)
            {
              attachment: {
                type: 'template',
                payload: {
                  elements: elements, template_type: 'generic'
                }
              }
            }
          end
        end
      end
    end
  end
end
