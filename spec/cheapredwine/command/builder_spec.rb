require 'spec_helper'
require 'cheapredwine/command/builder'

describe Cheapredwine::Command::Builder do
  let(:builder) { Cheapredwine::Command::Builder.new }

  it "sets liga to off by default" do
    expect(builder.features).to eq ["-liga"]
  end

  it "transforms it's data to params" do
    builder.append_text "hello"
    builder.append_text " world"

    expect(builder.to_params).to eq features: "-liga", text: "hello world"
  end

  it "transforms it's data to params along with features" do
    builder.append_text "ffi", with: ["liga"]
    builder.append_text "stffi"
    builder.append_text "st", with: ["dlig"]

    expect(builder.to_params).to eq features: "-liga,liga[0:3],dlig[8:10]", text: "ffistffist"
  end

  context "with features" do
    let(:builder) { Cheapredwine::Command::Builder.new }

    it "can turn on a features" do
      builder.turn_on_feature "liga"
      expect(builder.features).to eq ["-liga", "+liga"]
    end

    it "can turn off a feature" do
      builder.turn_off_feature "onum"
      expect(builder.features).to eq ["-liga", "-onum"]
    end
  end
end