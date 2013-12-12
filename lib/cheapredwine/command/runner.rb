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
        builder.to_params.map { |k, v| parameterize_pair k, v }
      end

      private

      def parameterize_pair key, val
        "--#{parameterize key}=#{val}"
      end

      def parameterize key
        key.to_s.gsub(/_/, "-")
      end
    end
  end
end