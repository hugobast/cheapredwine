module CheapRedWine
  module Image
    class Params
      attr_reader :font, :color, :text, :features, :size, :margin

      def initialize(options = {})
        @font = options.fetch(:font) 
        @color = options.fetch(:color) { 'black' }
        @text = options.fetch(:text) { '' }
        @features = options.fetch(:features) { [] }
        @size = options.fetch(:size) { 20 }
        @margin = options.fetch(:margin) { 5 }
      end 
    end
  end
end
