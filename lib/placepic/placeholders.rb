module PlacePic
  module Placeholders

    def placeholder_tag(width = 100, height = nil, opts = {})
      Placeholders.placeholder_tag(width, height, opts)
    end

    def placeholder_url(width = 100, height = nil, opts = {})
      Placeholders.placeholder_url(width, height, opts)
    end

    class << self
      def placeholder_tag(width = 100, height = nil, opts = {})
        height = width unless height
        image_url = placeholder_url(width, height, opts)
        tag_opts = opts.except(:style, :site)
        tag_opts[:alt] = "placeholder-#{width}x#{height}" unless tag_opts[:alt]

        ActionController::Base.helpers.image_tag(image_url, tag_opts)
      end

      def placeholder_url(width = 100, height = nil, opts = {})
        height = width unless height
        url, style = PlacePic::Urls.url_and_style(opts)

        "//#{url}.com/#{style}/#{width}/#{height}"
      end
    end
  end
end