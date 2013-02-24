require "cheapredwine/version"
require "cheapredwine/ttx"
require "cheapredwine/image"

CheapRedWine::TTX.configure do |config|
  config.output_folder = 'spec/fixtures'
end

module CheapRedWine
  class Font
    attr_accessor :name, :family, :features, :file

    def initialize
      yield(self) if block_given?
    end
  end

  def self.font(file)
    parser = TTX.for_font(file)
    Font.new do |font|
      font.name = parser.font_name
      font.family = parser.family_name
      font.features = parser.features
      font.file = file
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

  private

  def self.merge_features(all_features, selected_features)
    all_features.map do |feature|
      prefix = selected_features.include?(feature) ? '+' : '-'
      prefix + feature
    end
  end
end
