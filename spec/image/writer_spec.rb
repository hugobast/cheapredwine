require 'cheapredwine/image/writer'
require 'cheapredwine/image/params'

describe Cheapredwine::Image::Writer do
  let(:font) { double("font", path: "spec/fixtures/lato-regular.ttf") }
  let(:image) { Cheapredwine::Image::Params.new(font: font, text: "Lorem ipsum") } 

  it "builds a command from a Params object" do
    writer = Cheapredwine::Image::Writer.new(image)
    writer.args[0].should eq "--font-file=spec/fixtures/lato-regular.ttf"
  end

  it "generates a image of given text" do
    file = File.new('spec/fixtures/test.png')

    writer = Cheapredwine::Image::Writer.new(image)
    tempfile = writer.exec
    FileUtils.compare_file(tempfile, file)
  end
end
