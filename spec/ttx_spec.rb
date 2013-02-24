require_relative '../ttx'

describe TTX do
  it "has configuration options" do
    TTX.configure do |config|
      config.output_folder = 'fixtures/ttx'
    end

    TTX.configuration.output_folder.should eq 'fixtures/ttx'
  end

  it "generates a ttx parser from a font file" do
    font = File.new('fixtures/ttx/hobo.otf')
    TTX.configuration.output_folder = 'fixtures/ttx'

    parser = TTX.for_font(font)
    parser.class.should eq TTX::Parser

    parser.family_name.should eq "Hobo Std"
    File.delete('fixtures/ttx/hobo.ttx')
  end  
end
