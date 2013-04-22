require 'cheapredwine/info'

describe CheapRedWine::Info do
  it "get info out of an otf or ttf font file" do
    font = 'spec/fixtures/hobo.otf'
    info = CheapRedWine::Info.new font
    info.font_name.should eq "Hobo Std Medium"
    info.family_name.should eq "Hobo Std"
    info.style.should eq "Regular"
    info.features.should eq ["aalt", "frac", "liga", "ordn", "sups"]
  end
end
