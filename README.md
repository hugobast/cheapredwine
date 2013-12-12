# Cheapredwine 

[![Code Climate](https://codeclimate.com/github/hugobast/cheapredwine.png)](https://codeclimate.com/github/hugobast/cheapredwine)
[![Build Status](https://travis-ci.org/hugobast/cheapredwine.png?branch=master)](https://travis-ci.org/hugobast/cheapredwine)

Makes text images. Introspecs (in a limited way thus far) a font file to get to it's metadata. Supports OTF/TTF font features the likes of ligatures, old style numbers, stylistic alternatives, etc. Cheapredwine uses of Harfbuzz' hb-view utility to generate images.

## Installation

Make sure the dependencies are satisfied

    $ gem install cheapredwine

## Dependencies

It assumes the following is installed and in the case where it applies; accessible from the $PATH env variable.

* [cairo](http://www.cairographics.org/releases/)
* [harfbuzz](http://www.freedesktop.org/software/harfbuzz/release/)

## Usage

#### Getting a font object from a simple ttf or otf file:

    font = Cheapredwine.new font_file
    font.font_name # => "Font Name"
    font.family_name # => "Font Family"
    font.style # => "Bold Italic"
    font.features # => ["liga", "onum", "dlig", … "salt"]
    
#### Generating images with text for the font:

    image = font.image do
      append_text "Hello"                   # A regular piece of text
      append_text "123456", with: ["onum"]  # A piece of text with 'onum' enable
      turn_on_feature "dlig"                # Turns a feature on for the whole image
      turn_off_feature "liga"               # Turns off a feature for the whole image
      set_margin 0
      set_font_size 32
      set_background "#123456"
      set_foreground "#654321"
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## TODO

1. Replace hb-view by something more appropriate (C Extension or pure Ruby implementation).
