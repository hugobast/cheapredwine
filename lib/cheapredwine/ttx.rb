require_relative 'ttx/parser'
require_relative 'ttx/extractor'

module TTX
  class Configuration
    attr_accessor :output_folder

    def initialize
      @output_folder = 'ttx'
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end 

  def self.for_font(font)
    extractor = Extractor.new(font, configuration.output_folder)
    Parser.new(extractor.ttx_file)
  end
end
