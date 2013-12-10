require 'cheapredwine/command/runner'
require 'cheapredwine/command/builder'

describe Cheapredwine::Command::Runner do
  let(:builder) {
    Cheapredwine::Command::Builder.new do |builder|
      builder.text "Lorem ipsum dolor"
      builder.turn_on "aalt"
      builder.font_size = 15
      builder.font_file = "/path/to/font.otf"
    end
  }

  let(:runner) { Cheapredwine::Command::Runner.new builder }

  it "assembles params from a builder" do
    expect(runner.params).to eq [
      "--features=-liga,+aalt",
      "--text=\"Lorem ipsum dolor\"",
      "--font-file=/path/to/font.otf",
      "--font-size=15"
    ]
  end

  it "executes the command" do
    expect(IO).to receive(:popen).with([
      "hb-view",
      "--features=-liga,+aalt",
      "--text=\"Lorem ipsum dolor\"",
      "--font-file=/path/to/font.otf",
      "--font-size=15"
    ])

    runner.run!
  end
end