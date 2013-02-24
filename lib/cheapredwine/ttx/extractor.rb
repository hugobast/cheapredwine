module CheapRedWine
  module TTX
    class Extractor
      def initialize(font_file, folder)
        path = File.join(folder, filename(font_file)) 
        unless File.exists?("#{path}.ttx")
          `ttx -d#{folder} #{font_file.path}`
        end
        @file = File.new("#{path}.ttx")
      end

      def ttx_file
        @file
      end

      private

      def filename(file)
        File.basename(file, File.extname(file))
      end
    end
  end
end
