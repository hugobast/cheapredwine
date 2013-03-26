require 'tipo'

module CheapRedWine
  class Info
    def initialize file
      @info = Tipo.info file
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
