shared_context 'yaml_parser' do
  def parsed_yaml # rubocop:disable Metrics/MethodLength
    [
      {
        'template_type' => 'button',
        'text' => nil,
        'buttons' => [
          {
            'title' => nil,
            'type' => 'postback', 'webview_height_ratio' => nil,
            'url' => nil, 'fallback_url' => nil,
            'payload' => { 'target_node' => nil, 'custom_data' => nil }
          }
        ]
      },
      {
        'template_type' => 'button',
        'text' => nil,
        'buttons' => [
          {
            'title' => nil,
            'type' => 'postback', 'webview_height_ratio' => nil,
            'url' => nil, 'fallback_url' => nil,
            'payload' => { 'target_node' => nil, 'custom_data' => nil }
          }
        ]
      }
    ]
  end

  def exported_yaml # rubocop:disable Metrics/MethodLength
    [
      {
        attachment: {
          type: 'template',
          payload: {
            text: nil,
            buttons: [
              {
                type: 'postback',
                title: nil,
                payload: {
                  'target_node' => nil,
                  'custom_data' => nil
                }
              }
            ],
            template_type: 'button'
          }
        }
      },
      {
        attachment: {
          type: 'template',
          payload: {
            text: nil,
            buttons: [
              {
                type: 'postback',
                title: nil,
                payload: {
                  'target_node' => nil,
                  'custom_data' => nil
                }
              }
            ],
            template_type: 'button'
          }
        }
      }
    ]
  end

  def overwrite_loader(klass)
    allow_any_instance_of(klass).to receive(:locate_yaml) do
      'spec/seed/button.yml'
    end
  end
end
