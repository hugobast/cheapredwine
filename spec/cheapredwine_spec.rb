require 'cheapredwine'
require 'tempfile'

describe CheapRedWine do
  let(:file) { File.new('spec/fixtures/hobo.otf') }
  let(:font) { CheapRedWine.font(file) }

  it "creates a Font object from a font file" do
    font.name.should eq "Hobo Std Medium"
    font.file.path.should match file.path
  end

  it "can create images from text" do
    options = { size: 26, features: ['liga', 'frac'] }
    image = CheapRedWine.image(font, 'ffi 1/2', options)
    tempfile = Tempfile.new('image')
    tempfile.write(image.read)
    tempfile.close
    mimetype = IO.popen(["file", "--brief", "--mime-type", tempfile.path]).
      read.chomp
    mimetype.should eq "image/png"
  end
end
