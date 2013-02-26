require 'cheapredwine'
require 'tempfile'

describe CheapRedWine do
  let(:file) { File.new('spec/fixtures/hobo.otf') }
  let(:meta) { CheapRedWine.meta(file) }

  it "sets the output folder" do
    CheapRedWine.ttx_output_folder = "spec/fixtures"
    CheapRedWine.ttx_output_folder.should eq "spec/fixtures"
  end

  it "gets meta information from a font file" do
    meta.name.should eq "Hobo Std Medium"
    meta.file.path.should match file.path
  end

  it "can create images from text" do
    options = { size: 26, features: ['liga', 'frac'] }
    image = CheapRedWine.image(meta, 'ffi 1/2', options)
    tempfile = Tempfile.new('image')
    tempfile.write(image.read)
    tempfile.close
    mimetype = IO.popen(["file", "--brief", "--mime-type", tempfile.path]).
      read.chomp
    mimetype.should eq "image/png"
  end
end
