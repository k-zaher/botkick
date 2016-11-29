module Botkick
  # Messenger Template
  class Template
    attr_accessor :title, :type, :data, :payload, :buttons,
                  :elements, :serializer

    def export
      serializer.export(self)
    end
  end

  # Button Template
  class ButtonTemplate
    attr_accessor :title, :payload, :type, :fallback_url, :url,
                  :webview_height_ratio
  end

  # Element Template
  class ElementTemplate
    attr_accessor :title, :subtitle, :image_url,
                  :buttons, :data
  end
end
