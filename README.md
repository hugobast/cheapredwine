# CheapRedWine

I needed a way to test fonts on the web. I based this library on myfonts.com. CheapRedWine makes use to Harfbuzz' hb-view utility to generate images from fonts with a slew of different parameters. It also uses fontTools' ttx utility for font introspection.

## Installation

Make sure the dependencies are satisfied

    $ gem install cheapredwine

## Dependencies

It assumes the following is installed and in the case where it applies, accessible from the $PATH env variable.

* [cairo](http://www.cairographics.org/releases/)
* [harfbuzz](http://www.freedesktop.org/software/harfbuzz/release/)
* [ttx](git@github.com:mcolyer/fonttools.git)

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
