require 'cheapredwine/info'

include CheapRedWine

describe Info do
  it "get info out of an otf or ttf font file" do
    font = 'spec/fixtures/hobo.otf'
    info = Info.new font
    info.font_name.should eq "Hobo Std Medium"
    info.family_name.should eq "Hobo Std"
    info.style.should eq "Regular"
    info.features.should eq ["aalt", "frac", "liga", "ordn", "sups"]
  end
end
