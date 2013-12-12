require "forwardable"
require "cheapredwine/version"
require "cheapredwine/command"
require "cheapredwine/parser"

class Cheapredwine
  extend Forwardable

  attr_accessor :file
  def_delegators :@attrs, :font_name, :family_name, :style, :features

  def initialize file
    @file = file
    @attrs = Parser.new file
  end

  def image &block
    create(&block).run!
  end

  def create &block
    builder.instance_eval &block
    builder.font_file file.path
    runner
  end

  private

  def builder
    @builder ||= Command::Builder.new
  end

  def runner
    @runner ||= Command::Runner.new builder
  end
end
