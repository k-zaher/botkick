module Botkick
  module Serializers
    module Button
      # Button Template
      module Attachment
        class << self
          def import(node)
            template            = Template.new
            template.type       = :button
            template.title      = node['title']
            template.buttons    = Serializers::Shared::ButtonBucket
                                  .import_all(node['buttons'])
            template.serializer = self
            template
          end

          def export(data)
            buttons = Serializers::Shared::ButtonBucket.export_all(data.buttons)
            {
              attachment: {
                type: 'template',
                payload: {
                  text: data.title, buttons: buttons,
                  template_type: 'button'
                }
              }
            }
          end
        end
      end
    end
  end
end
