class Botkick::Template

	attr_accessor :title, :type, :data, :payload, :buttons, :elements, :serializer

	def export
		self.serializer.export(self)
	end

	def self.export_all(templates)
		templates.map{|t| t.export}
	end
end

class Botkick::Button
	attr_accessor :title, :payload, :type, :fallback_url, :url, :webview_height_ratio

end

class Botkick::Element
	attr_accessor :title, :subtitle, :image_url, :buttons, :data
end