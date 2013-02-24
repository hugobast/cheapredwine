require 'cheapredwine/ttx/extractor'

include CheapRedWine::TTX

describe Extractor do
  before do
    font_file = File.new('spec/fixtures/extractor/hobo.otf')
    @extractor = Extractor.new(font_file, 'spec/fixtures/extractor')
  end

  after do
    File.delete('spec/fixtures/extractor/hobo.ttx')
  end

  it "converts font files to readable ttx file" do
    File.exist?('spec/fixtures/extractor/hobo.ttx').should be true
  end

  it "has a reference to the ttx file" do
    @extractor.ttx_file.path.should eq 'spec/fixtures/extractor/hobo.ttx'
  end
end
