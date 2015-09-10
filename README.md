# PlacePic

[![Gem Version](https://badge.fury.io/rb/placepic.svg)](http://badge.fury.io/rb/placepic)

PlacePic generates placeholder image tags and image urls for use whilst developing rails websites.

# Quickstart

```ruby
placeholder_url
placeholder_url(width)
placeholder_url(width, height)
placeholder_url(width, height, site: site_name)
placeholder_url(width, height, style: style_code)
placeholder_url(width, height, site: site_name, style: style_code)
placeholder_tag
placeholder_tag(width)
placeholder_tag(width, height)
placeholder_tag(width, height, site: site_name)
placeholder_tag(width, height, style: style_code)
placeholder_tag(width, height, site: site_name, style: style_code)
```

####Options

| site            | styles               |
| --------------- | -------------------- |
| placebear       | '', 'g',             |
| stevensegallery | '', 'g',             |
| fillmurray      | '', 'g',             |
| placecage       | '', 'g', 'c', 'gif'  |
| lorempixel      | '', 'g',             |

# Image Sources

* placebear.com
* stevensegallery.com
* fillmurray.com
* placecage.com
* lorempixel.com

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'placepic'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install placepic

## Usage

```ruby
5.times { puts placeholder_url } # =>
  # //placebear.com//100/100
  # //stevensegallery.com//100/100
  # //placecage.com/g/100/100
  # //stevensegallery.com/g/100/100
  # //lorempixel.com//100/100

# If you specify just a width, the height will be the same as the width
placeholder_url(150)
  # => "//fillmurray.com//150/150"

# You can specify width and height separately.
placeholder_url(150, 250)
  # => "//fillmurray.com//150/250"

# You acn specify the site to use from the list below. It will raise an error
# if you send an invalid site.
placeholder_url(150, 150, site: 'placecage')
  # => "//placecage.com//150/150"
placeholder_url(150, 150, site: 'lorempixel')
  # => "//lorempixel.com/g/150/150"
placeholder_url(150, 150, site: 'asd')
  # => ArgumentError: Site not supported

# The style option will pick an appropriate placeholder site for the style
# you want. It'll raise an ArgumentError if you send a style that doesn't have
# a corresponding site.
placeholder_url(150, 150, style: 'g')
  # => "//fillmurray.com/g/150/150"
placeholder_url(150, 150, style: 'c')
  # => "//placecage.com/c/150/150"
placeholder_url(150, 150, style: 'p')
  # => ArgumentError: No Supported Placeholder Site With This Style - Try g, c, or gif

# You can specify both style and site. Although if the combo doesn't exist, it'll
# raise an error
placeholder_url(150, 150, style: 'g', site: 'placecage')
  # => "//placecage.com/g/150/150"
placeholder_url(150, 150, style: 'c', site: 'fillmurray')
  # =>  ArgumentError: Style not supported by this site

# placeholder_tag generates an image_tag with the url generated from passing the
# given parameters through to placeholder_url
5.times { puts placeholder_tag } # =>
  # <img alt="placeholder-100x100" src="//stevensegallery.com//100/100" />
  # <img alt="placeholder-100x100" src="//lorempixel.com//100/100" />
  # <img alt="placeholder-100x100" src="//stevensegallery.com//100/100" />
  # <img alt="placeholder-100x100" src="//fillmurray.com/g/100/100" />
  # <img alt="placeholder-100x100" src="//placebear.com//100/100" />
```

## Development

1. bundle install
2. rake spec
3. 'rails c' to enter a rails console with the placepic gem loaded

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Lockyy/placepic. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

