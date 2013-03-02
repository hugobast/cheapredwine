require 'cheapredwine/ttx/parser'

include CheapRedWine::TTX

describe Parser do
  let(:file) { File.open('spec/fixtures/parser/hobo.ttx') }
  let(:ttx) { Parser.new(file) }

  it "parses a list of opentype features from ttx files" do
    ttx.features.should eq ["kern", "size", "aalt", "frac", "liga", "ordn", "sups"] 
  end

  it "parses attributes" do
    ttx.family_name.should eq "Hobo Std" 
    ttx.font_name.should eq "Hobo Std Medium"
    ttx.style.should eq "Regular"
  end
end
