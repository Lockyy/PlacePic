module PlacePic
  module Placeholders

    def placeholder_tag(width, height, opts = {})
      image_url = placeholder_url(width, height, opts)
      tag_opts = opts.except(:style, :site)

      image_tag(image_url, tag_opts)
    end

    def placeholder_url(width, height, opts = {})
      url, style = PlacePic::Urls.url_and_style(opts)

      "//#{url}.com/#{style}/#{width}/#{height}"
    end
  end
end