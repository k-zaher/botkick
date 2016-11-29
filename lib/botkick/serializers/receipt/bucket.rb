module Botkick
  module Serializers
    module Receipt
      # Messenger Receipt Element Module
      module Bucket
        class << self
          def import_all(elements)
            elements.map { |e| import(e) }
          end

          def export_all(elements)
            elements.map { |e| export(e) }
          end

          private

          def export(element)
            {
              title:     element.data['title'],
              price:     element.data['price'],
              quantity:  element.data['quantity'],
              subtitle:  element.data['subtitle'],
              currency:  element.data['currency'],
              image_url: element.data['image_url']
            }
          end

          def import(element_data)
            element      = ElementTemplate.new
            element.data = element_data['data']
            element
          end
        end
      end
    end
  end
end
