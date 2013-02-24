module CheapRedWine
  module Image
    class Params
      attr_reader :font, :color, :text, :features, :size

      def initialize(options = {})
        @font = options.fetch(:font) 
        @color = options.fetch(:color) { 'black' }
        @text = options.fetch(:text) { '' }
        @features = options.fetch(:features) { [] }
        @size = options.fetch(:size) { 20 }
      end 
    end
  end
end
