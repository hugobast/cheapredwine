require "cheapredwine/version"
require "cheapredwine/info"
require "cheapredwine/image"


class CheapRedWine
  class Meta 
    attr_accessor :name, :family, :features, :path, :style

    def initialize
      yield(self) if block_given?
    end

    def file
      File.new(path)
    end
  end

  def self.meta(file)
    parser = Info.new file
    Meta.new do |meta|
      meta.name = parser.font_name
      meta.family = parser.family_name
      meta.features = parser.features
      meta.style = parser.style
      meta.path = file
    end
  end

  def self.image(font, text, options = {})
    features = merge_features(font.features, options.fetch(:features) { [] })
    options.merge!({ 
      features: features,
      font: font.file,
      text: text
    })
    params = Image::Params.new(options)
    Image::Writer.new(params).exec
  end

  def self.merge_features(all_features, selected_features)
    all_features.map do |feature|
      prefix = selected_features.include?(feature) ? '+' : '-'
      prefix + feature
    end
  end
end
