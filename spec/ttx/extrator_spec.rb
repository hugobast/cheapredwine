require_relative '../../ttx/extractor'

include TTX

describe Extractor do
  before do
    font_file = File.new('fixtures/extractor/hobo.otf')
    @extractor = Extractor.new(font_file, 'fixtures/extractor')
  end

  after do
    File.delete('fixtures/extractor/hobo.ttx')
  end

  it "converts font files to readable ttx file" do
    File.exist?('fixtures/extractor/hobo.ttx').should be true
  end

  it "has a reference to the ttx file" do
    @extractor.ttx_file.path.should eq 'fixtures/extractor/hobo.ttx'
  end
end
