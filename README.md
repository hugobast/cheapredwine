# CheapRedWine 

[![Code Climate](https://codeclimate.com/github/hugobast/cheapredwine.png)](https://codeclimate.com/github/hugobast/cheapredwine)



I needed a way to test fonts on the web. I based this library on myfonts.com. CheapRedWine makes use to Harfbuzz' hb-view utility to generate images from fonts with a slew of different parameters. It also uses fontTools' ttx utility for font introspection.

## Installation

Make sure the dependencies are satisfied

    $ gem install cheapredwine

## Dependencies

It assumes the following is installed and in the case where it applies, accessible from the $PATH env variable.

* [cairo](http://www.cairographics.org/releases/)
* [harfbuzz](http://www.freedesktop.org/software/harfbuzz/release/)

## Usage

#### Getting a font object from a simple ttf or otf file:

    font = CheapRedWine.meta(font_file)
    font.name # => "Font Name"
    font.family # => "Font Family"
    font.style # => "Bold Italic"
    font.features # => ["liga", "onum", "dlig", … "salt"]
    
#### Generating images with text for the font:

    image = CheapRedWine.image(font, "some text", options)
    
**Caveat:** `image` is an IO object that can then be use to write to disk. `font` is any object that responds to `#features` and produces a list `["onum", "liga"]` as well as provide a font file object through `#file`. `file` need only know of it's full path to work properly.
    
##### Options

    options = {
      margin: 5, 				# margin around the text
      size: 40, 				# size of the text eq to px
      color: red, 				# the text color
      features: [liga, salt]	# list of otf features to be applied
    }

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## TODO

1. Replace hb-view by something more appropriate (C Extension).
