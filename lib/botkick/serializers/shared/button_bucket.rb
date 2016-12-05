module Botkick
  module Serializers
    module Shared
      # Messenger Shared Button
      module ButtonBucket
        class << self
          def import_all(buttons_data)
            buttons_data.map { |d| import(d) }
          end

          def export_all(buttons)
            buttons.map do |b|
              unless b.type
                raise 'Button type must be'\
                'either [web_url, postback]'
              end
              send(b.type, b)
            end
          end

          private

          def web_url(button)
            {
              type:  'web_url',
              title: button.title,
              webview_height_ratio: button.webview_height_ratio || 'full',
              messenger_extensions: true,
              url: button.url,
              fallback_url: button[:fallback_url]
            }
          end

          def postback(button)
            {
              type:    'postback',
              title:   button.title,
              payload: button.payload.to_s
            }
          end

          def import(data)
            button                       = ButtonTemplate.new
            button.title                 = data['title']
            button.payload               = data['payload']
            button.type                  = data['type']
            button.fallback_url          = data['fallback_url']
            button.url                   = data['url']
            button.webview_height_ratio  = data['webview_height_ratio']
            button
          end
        end
      end
    end
  end
end
