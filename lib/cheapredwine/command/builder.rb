require 'cheapredwine/command/nodes'

class Cheapredwine
  module Command
    class Builder
      attr_reader :features, :nodes
      attr_accessor :font_file, :font_size, :foreground, :background, :margin

      def initialize
        @features = ["-liga"]
        @nodes = Nodes.new
        yield self if block_given?
      end

      def text text, features = []
        nodes.add text, features
      end

      def turn_on feature
        features.push "+#{feature}"
      end

      def turn_off feature
        features.push "-#{feature}"
      end

      def to_params
        {
          features: "#{all_features.join(",")}",
          text: "\"#{nodes.concat}\"",
          font_file: font_file,
          font_size: font_size,
          foreground: foreground,
          background: background,
          margin: margin
        }.reject { |key, val| val.nil? }
      end

      private

      def all_features
        features + all_features_from_text
      end

      def all_features_from_text
        nodes.all.map { |node| node.features }.flatten
      end
    end
  end
end