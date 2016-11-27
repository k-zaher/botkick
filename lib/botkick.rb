require "botkick/version"
require "yaml"
require "botkick/template"
require "serializers"
require 'botkick/railtie' if defined?(Rails)

module Botkick
  module Base
		require "botkick/base/bot"
  end
end
