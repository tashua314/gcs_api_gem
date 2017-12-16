module GcsApiGem
  # SearchApi
  class SearchApi
    class << self
      def image(keyword)
        return { error: 'Please set KEY to environment variable.' } if key_is_ng?
        return { error: 'Please set CSE_ID to environment variable.' } if cse_id_is_ng?

        choice(fetch(keyword))
      end

      private

      def key_is_ng?
        blank?(ENV['KEY'])
      end

      def cse_id_is_ng?
        blank?(ENV['CSE_ID'])
      end

      def url
        'https://www.googleapis.com/customsearch/v1'
      end

      def query(keyword)
        {
          'key' => ENV['KEY'],
          'cx' => ENV['CSE_ID'],
          'searchType' => 'image',
          'q' => keyword,
          'start' => rand(50) + 1
        }
      end

      def fetch(keyword)
        client = HTTPClient.new
        res = client.get(url, query(keyword))
        JSON.parse res.body
      end

      def choice(res)
        if blank?(res['error'])
          if res['searchInformation']['totalResults'].to_i.zero?
            return { error: 'Search result was 0.' }
          end
          formatted_item(res)
        else
          res['error']
        end
      end

      def blank?(obj)
        obj.nil? || obj.empty?
      end

      def formatted_item(res)
        item = res['items'][rand(res['items'].count)]
        {
          title: item['title'],
          image: item['link'],
          search_result: res['searchInformation']['totalResults']
        }
      end
    end
  end
end
