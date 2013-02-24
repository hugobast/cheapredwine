require 'cheapredwine/ttx'

include CheapRedWine

describe TTX do
  it "has configuration options" do
    TTX.configure do |config|
      config.output_folder = 'spec/fixtures/ttx'
    end

    TTX.configuration.output_folder.should eq 'spec/fixtures/ttx'
  end

  it "generates a ttx parser from a font file" do
    font = File.new('spec/fixtures/ttx/hobo.otf')
    TTX.configuration.output_folder = 'spec/fixtures/ttx'

    parser = TTX.for_font(font)
    parser.class.should eq TTX::Parser

    parser.family_name.should eq "Hobo Std"
  end  
end
