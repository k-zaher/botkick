module Botkick
  module Serializers
    module Receipt
      # Messenger Reciept Template Module
      module Attachment
        class << self
          def import(node)
            template            = Template.new
            template.type       = :receipt
            template.data       = node['data']
            template.elements   = Serializers::Generic::Bucket
                                  .import_all(node['elements'])
            template.serializer = self
            template
          end

          def export(template) # rubocop:disable Metrics/MethodLength
            elements = Serializers::Receipt::Bucket
                       .export_all(template.elements)
            hash = {
              attachment: {
                type:     'template',
                payload: {
                  elements:       elements,
                  template_type:  'receipt',
                  summary: summary(template.data)
                }
              }
            }
            hash.merge!(receipt_attrs(template))
          end

          private

          def receipt_attrs(template)
            {
              currency:       template.data['currency'],
              order_url:      template.data['order_url'],
              timestamp:      template.data['timestamp'],
              order_number:   template.data['order_number'],
              recipient_name: template.data['recipient_name'],
              payment_method: template.data['payment_method']
            }
          end

          def summary(data)
            {
              subtotal:      data['subtotal'],
              total_tax:     data['total_tax'],
              total_cost:    data['total_cost'],
              shipping_cost: data['shipping_cost']
            }
          end
        end
      end
    end
  end
end
