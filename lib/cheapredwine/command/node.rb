class Cheapredwine
  module Command
    class Node
      attr_reader :text, :starts_at

      def initialize text, features, starts_at
        @text = text
        @features = features
        @starts_at = starts_at
      end

      def features
        @features.map do |feature|
          "#{feature}[#{starts_at}:#{starts_at + text.length}]"
        end
      end
    end
  end
end