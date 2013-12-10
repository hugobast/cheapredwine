require 'spec_helper'
require 'cheapredwine/command/builder'

describe Cheapredwine::Command::Builder do
  let(:builder) { Cheapredwine::Command::Builder.new }

  it "sets liga to off by default" do
    expect(builder.features).to eq ["-liga"]
  end

  it "transforms it's data to params" do
    builder.text "hello"
    builder.text " world"

    expect(builder.to_params).to eq features: "-liga", text: "hello world"
  end

  it "transforms it's data to params along with features" do
    builder.text "ffi", ["liga"]
    builder.text "stffi"
    builder.text "st", ["dlig"]

    expect(builder.to_params).to eq features: "-liga,liga[0:3],dlig[8:10]", text: "ffistffist"
  end

  context "with features" do
    let(:builder) { Cheapredwine::Command::Builder.new }

    it "can turn on a features" do
      builder.turn_on "liga"
      expect(builder.features).to eq ["-liga", "+liga"]
    end

    it "can turn off a feature" do
      builder.turn_off "onum"
      expect(builder.features).to eq ["-liga", "-onum"]
    end
  end
end