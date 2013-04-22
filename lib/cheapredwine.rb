require "cheapredwine/version"
require "cheapredwine/info"
require "cheapredwine/image"

class CheapRedWine
  extend Forwardable
  attr_accessor :font
  def_delegators :@font, :file, :name, :family, :style, :features

  def initialize(file)
    info = Info.new file
    @font = Font.new do |font|
      font.name = info.font_name
      font.family = info.family_name
      font.features = info.features
      font.style = info.style
      font.path = file
      font
    end
  end

  def image(text, options = {})
    features = merge_features(font.features, options.fetch(:features) { [] })
    options.merge!({ 
      features: features,
      font: font.file,
      text: text
    })
    params = Image::Params.new(options)
    Image::Writer.new(params).exec
  end

  private

  def merge_features(all_features, selected_features)
    all_features.map do |feature|
      prefix = selected_features.include?(feature) ? '+' : '-'
      prefix + feature
    end
  end

  class Font
    attr_accessor :name, :family, :features, :path, :style

    def initialize
      yield(self) if block_given?
    end

    def file
      File.new(path)
    end
  end
end
