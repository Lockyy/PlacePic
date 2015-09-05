module PlacePic
  class Placeholders
    class << self

      def placeholder_tag(width, height = width, opts = {})
        image_url = placeholder_image_url(width, height, opts)
        tag_opts = opts.except(:style, :url)

        image_tag(image_url, tag_opts)
      end

      def placeholder_url(width, height = width, opts = {})
        url, style = PlacePic::Urls.url_and_style(opts)

        "http://#{url}.com/#{style}/#{width}/#{height}"
      end
    end
  end
end