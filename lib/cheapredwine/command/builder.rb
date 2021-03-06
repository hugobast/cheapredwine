require 'cheapredwine/command/nodes'

class Cheapredwine
  module Command
    class Builder
      attr_reader :features, :nodes

      def initialize
        @features = ["-liga"]
        @nodes = Nodes.new
        yield self if block_given?
      end

      def append_text text, options = {}
        nodes.add text, options.fetch(:with, [])
      end

      def set_margin size
        @margin = size
      end

      def set_font_size size
        @font_size = size
      end

      def font_file file
        @font_file = file
      end

      def set_foreground color
        @foreground = color
      end

      def set_background color
        @background = color
      end

      def turn_on_feature feature
        features.push "+#{feature}"
      end

      def turn_off_feature feature
        features.push "-#{feature}"
      end

      def to_params
        {
          features: "#{all_features.join(",")}",
          text: "#{nodes.concat}",
          font_file: @font_file,
          font_size: @font_size,
          foreground: @foreground,
          background: @background,
          margin: @margin
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