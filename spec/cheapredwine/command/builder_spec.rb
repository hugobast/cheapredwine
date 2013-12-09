require 'spec_helper'
require 'cheapredwine/command/builder'

describe Cheapredwine::Command::Builder do
  it "has sets liga to off by default" do
    builder = Cheapredwine::Command::Builder.new
    expect(builder.features).to eq ["-liga"]
  end

  it "can initialize with a block" do
    builder = Cheapredwine::Command::Builder.new do |b|
      b.font_size = 100
    end

    expect(builder.font_size).to eq 100
  end

  it "transforms it's data to params" do
    params = Cheapredwine::Command::Builder.new do |b|
      b.append_text "hello"
      b.append_text " world"
    end.to_params

    expect(params).to eq ["--features=-liga", '--text="hello world"']
  end

  it "transforms it's data to params along with features" do
    params = Cheapredwine::Command::Builder.new do |b|
      b.append_text "ffi", features: ["liga"]
      b.append_text "st"
      b.append_text "ffi"
      b.append_text "st", features: ["dlig"]
    end.to_params

    expect(params).to eq ["--features=-liga,liga[0:3],dlig[8:10]", '--text="ffistffist"']
  end

  context "with text" do
    let(:builder) { Cheapredwine::Command::Builder.new }

    it "default to empty string" do
      expect(builder).to have_text []
    end

    it "can append text" do
      builder.append_text "hello"
      builder.append_text " world"
      expect(builder).to have_text [
        { text: "hello", features: [] },
        { text: " world", features: [] }
      ]
    end

    it "can prepend text" do
      builder.append_text "world"
      builder.prepend_text "hello "
      expect(builder).to have_text [
        { text: "hello ", features: [] },
        { text: "world", features: [] }
      ]
    end

    it "can enable features for a chunk of text" do
      builder.append_text "hello", features: ["liga", "dlig"]
      expect(builder).to have_text [{ text: "hello", features: ["liga", "dlig"] }]
    end
  end

  context "with features" do
    let(:builder) { Cheapredwine::Command::Builder.new }

    it "can turn on a features" do
      builder.turn_feature_on "liga"
      expect(builder).to have_features ["-liga", "+liga"]
    end

    it "can turn off a feature" do
      builder.turn_feature_off "onum"
      expect(builder).to have_features ["-liga", "-onum"]
    end
  end
end