require "cheapredwine/version"
require "cheapredwine/parser"

class Cheapredwine
  extend Forwardable

  attr_accessor :file
  def_delegators :@font_attrs, :font_name, :family_name, :style, :features

  def initialize file
    @font_attrs = Parser.new file
    @file = File.new file
  end

  def image &block
    builder = Cheapredwine::Command::Builder.new
    builder.instance_eval &block
    builder.font_file file.path
    Cheapredwine::Command::Runner.new(builder).run!
  end

  private

  def merge_features(all_features, selected_features)
    all_features.map do |feature|
      prefix = selected_features.include?(feature) ? '+' : '-'
      prefix + feature
    end
  end
end
