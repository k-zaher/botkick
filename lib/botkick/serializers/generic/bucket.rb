module Botkick
  module Serializers
    module Generic
      # Messenger Element Module
      module Bucket
        class << self
          def import_all(elements_data)
            elements_data.map { |e| import(e) }
          end

          def export_all(elements)
            elements.map { |e| export(e) }
          end

          private

          def export(element)
            buttons = Serializers::Shared::ButtonBucket
                      .export_all(element.buttons)
            {
              title:      element.title,
              buttons:    buttons,
              subtitle:   element.subtitle,
              image_url:  element.image_url
            }
          end

          def import(data)
            element           = ElementTemplate.new
            element.title     = data['title']
            element.subtitle  = data['subtitle']
            element.image_url = data['image_url']
            element.buttons   = Serializers::Shared::ButtonBucket
                                .import_all(data['buttons'])
            element
          end
        end
      end
    end
  end
end
