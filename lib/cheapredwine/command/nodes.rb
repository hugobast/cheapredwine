require 'cheapredwine/command/node'

class Cheapredwine
  module Command
    class Nodes
      attr_reader :nodes

      def initialize
        @nodes = []
      end

      def add text, features
        nodes << Node.new(text, features, length)
      end

      def all
        nodes
      end

      def concat
        nodes.map { |node| node.text }.join
      end

      def length
        concat.length
      end
    end
  end
end