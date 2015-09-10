module PlacePic
  class Urls
    class << self
      URLS = {
        'placebear' => {
          styles: ['', 'g']
        },
        'stevensegallery' => {
          styles: ['', 'g']
        },
        'fillmurray' => {
          styles: ['', 'g']
        },
        'placecage' => {
          styles: ['', 'g', 'c', 'gif']
        },
        'lorempixel' => {
          styles: ['', 'g']
        }
      }

      def url_and_style(opts = {})
        # Prettify the variables we'll be using.
        requested_url = opts[:site]
        requested_style = opts[:style]

        # If the user asked for a specific URL then try and get them it.
        # If it doesn't exist, throw an error.
        if requested_url
          throw ArgumentError, 'URL not support' unless URLS.keys.include? requested_url
          # If they also requested a style, try to get them it.
          # Throw an error if that url doesn't support that style
          if requested_style
            throw ArgumentError, 'Style not supported' unless URLS[requested_url][:styles].include? requested_style
            return [requested_url, requested_style]
          end
          return [requested_url, random_style_for_url(requested_url)]
        # If they requested a style, get a random url for that style.
        elsif requested_style
          [random_url_for_style(requested_style), requested_style]
        # Generate a random url and style for that url
        else
          random_url_and_style
        end
      end

      # Takes in a style and attempts to find a service that supports that style
      # If it can't find out it'll throw an error.
      def random_url_for_style(style)
        urls = URLS.select { |_, value| value[:styles].include? style }.keys
        url = urls.sample(1)[0]

        return url if url
        throw ArgumentError,
              %q(Invalid Style Sent -
                 No Supported Placeholder Sites With This Style -
                 Try g, c, or gif)
      end

      # Get a random service, and a random style for that service
      def random_url_and_style
        url = URLS.keys.sample(1)[0]
        [url, random_style_for_url(url)]
      end

      # Get a random style for a given url
      def random_style_for_url(url)
        URLS[url][:styles].sample(1)[0]
      end
    end
  end
end