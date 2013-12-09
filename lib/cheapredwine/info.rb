require 'tipo'

class Cheapredwine
  class Info
    def initialize file, parser = Tipo
      @info = parser.info file
    end

    def font_name
      @info.naming.name
    end

    def family_name
      @info.naming.family_name
    end

    def style
      @info.naming.style
    end

    def features
      @info.substitution.feature_list.map do |fea|
        fea.tag
      end.uniq
    end
  end
end
