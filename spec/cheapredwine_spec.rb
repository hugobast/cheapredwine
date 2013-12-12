require 'cheapredwine'
require 'tempfile'

describe Cheapredwine do
  let(:file) { File.new('spec/fixtures/hobo.otf') }
  let(:wine) { Cheapredwine.new(file) }

  it "gets meta information from a font file" do
    wine.font_name.should eq "Hobo Std Medium"
    wine.file.path.should match file.path
  end

  it "can create images from text" do
    expect(IO).to receive(:popen).with [
      "hb-view",
      "--features=-liga,+onum,dlig[11:13]",
      "--text=ffi 1234567st",
      "--font-file=spec/fixtures/hobo.otf",
      "--font-size=92",
      "--margin=0"
    ]

    image = wine.image do
      append_text "ffi 1234567"
      turn_on_feature "onum"
      append_text "st", ["dlig"]
      set_margin 0
      set_font_size 92
    end
  end
end
