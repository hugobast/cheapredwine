require 'tipo'

module CheapRedWine
  class Info
    def initialize file
      @info = Tipo.info file
    end

    def name
      @info.naming.name
    end

    def family
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
