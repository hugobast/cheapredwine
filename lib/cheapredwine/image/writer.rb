class CheapRedWine
  module Image
    class Writer 
      def initialize(image, utility = 'hb-view')
        @utility = utility
        @image = image
      end

      def args
        [font_file, text, margin, foreground, features, size]
      end

      def exec
        IO.popen(args.unshift(@utility))
      end

      private

      def font_file
        "--font-file=#{@image.font.path}"
      end

      def text
        "--text=#{@image.text}"
      end

      def size
        "--font-size=#{@image.size}"
      end

      def foreground 
        "--foreground=#{@image.color}"
      end 

      def margin
        "--margin=#{@image.margin}"
      end

      def features
        "--features=#{@image.features.join(",")}"
      end
    end
  end
end
