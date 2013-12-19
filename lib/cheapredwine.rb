require "forwardable"
require "cheapredwine/version"
require "cheapredwine/command"
require "cheapredwine/parser"

class Cheapredwine
  extend Forwardable

  attr_accessor :file
  def_delegators :attrs, :font_name, :family_name, :style, :features

  def initialize file
    @file = file
  end

  def image &block
    create(&block).run!
  end

  def create
    yield builder if block_given?
    builder.font_file file.path
    runner
  end

  def attrs
    @attrs ||= Parser.new file
  end

  private

  def builder
    @builder ||= Command::Builder.new
  end

  def runner
    @runner ||= Command::Runner.new builder
  end
end
