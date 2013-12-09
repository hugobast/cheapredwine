require 'ostruct'

class Cheapredwine
  module Command
    class Builder < OpenStruct
      def initialize
        super(defaults)
        yield self if block_given?
      end

      def append_text string, options = {}
        self.text.push text: string, features: options.fetch(:features, [])
      end

      def prepend_text string, options = {}
        self.text.unshift text: string, features: options.fetch(:features, [])
      end

      def turn_feature_on feature
        self.features.push "+#{feature}"
      end

      def turn_feature_off feature
        self.features.push "-#{feature}"
      end

      def to_params
        ["--features=#{all_features.join(",")}",
          "--text=\"#{all_text.join}\""]
      end

      private

      def defaults
        { features: ["-liga"], text: [] }
      end

      def all_text
        self.text.map { |text| text[:text] }
      end

      def all_features
        self.features + all_features_from_text
      end

      def all_features_from_text
        length = 0
        features = self.text.map do |text|
          text_length = text[:text].length

          f = text[:features].map do |feature|
            "#{feature}[#{length}:#{length + text_length}]"
          end

          length += text_length
          f
        end
        features.flatten
      end
    end
  end
end