require_relative '../../ttx/parser'

include TTX

describe Parser do
  let(:file) { File.open('fixtures/parser/hobo.ttx') }
  let(:ttx) { Parser.new(file) }

  it "parses a list of opentype features from ttx files" do
    ttx.features.should eq ["kern", "size", "aalt", "frac", "liga", "ordn", "sups"] 
  end

  it "parses name font family and font name" do
    ttx.family_name.should eq "Hobo Std" 
    ttx.font_name.should eq "Hobo Std Medium"
  end
end
