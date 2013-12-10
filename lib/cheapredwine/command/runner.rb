class Cheapredwine
  module Command
    class Runner
      attr_reader :builder

      def initialize builder
        @builder = builder
      end

      def run!
        IO.popen params.unshift "hb-view"
      end

      def params
        builder.to_params.map do |key, val|
          "--#{parameterize key}=#{val}"
        end
      end

      private

      def parameterize key
        key.to_s.gsub(/_/, "-")
      end
    end
  end
end