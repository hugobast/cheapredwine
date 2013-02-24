require 'nokogiri'

class NokogiriParser
  @@parser = Nokogiri::XML::Document

  def self.parse(file)
    @@parser.parse(file)
  end
end

module TTX
  class Parser
    def initialize(file, xml_parser = NokogiriParser)
      @document = xml_parser.parse(file)
    end

    def features
      @document.css('FeatureTag').map do |feature| 
        feature.attr('value') 
      end.uniq
    end

    def font_name 
      namerecord(4).first.text.strip
    end

    def family_name
      namerecord(1).first.text.strip
    end

    def namerecord(id)
      @document.xpath("//namerecord[@nameID=#{id}]")
    end
  end
end
