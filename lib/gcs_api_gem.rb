require 'gcs_api_gem/version'
require 'httpclient'
require 'json'

# GoogleCustomSearchAPI
module GcsApiGem
  # SearchApi
  class SearchApi
    class << self
      def image(keyword)
        res = choice(fetch(keyword))
        { title: res['title'], image: res['link'] }
      end

      private

      def url
        'https://www.googleapis.com/customsearch/v1'
      end

      def query(keyword)
        {
          'key' => KEY,
          'cx' => CSE_ID,
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
        res['items'][rand(10)]
      end
    end
  end
end
