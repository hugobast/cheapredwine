require 'cheapredwine'
require 'tempfile'

describe Cheapredwine do
  let(:file) { File.new('spec/fixtures/hobo.otf') }
  let(:wine) { Cheapredwine.new(file) }

  it "gets meta information from a font file" do
    wine.name.should eq "Hobo Std Medium"
    wine.file.path.should match file.path
  end

  it "can create images from text" do
    options = { size: 26, features: ['liga', 'frac'] }
    image = wine.image 'ffi 1/2', options
    tempfile = Tempfile.new('image')
    tempfile.write(image.read)
    tempfile.close
    mimetype = IO.popen(["file", "--brief", "--mime-type", tempfile.path]).
      read.chomp
    mimetype.should eq "image/png"
  end
end
