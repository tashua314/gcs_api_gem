require 'gcs_api_gem/version'
require 'httpclient'
require 'json'
require 'pry'

# GoogleCustomSearchAPI
module GcsApiGem
  # SearchApi
  class SearchApi
    class << self
      # KEY = 'AIzaSyAPp6rZJ82KK-JpGZIJlcCuOd8VXgb2Foc'.freeze
      # CSE_ID = '016842321456273500576:jfsyjalna2m'.freeze

      def image(keyword)
        return { error: 'Please set KEY to environment variable.' } if blank?(ENV['KEY'])
        return { error: 'Please set CSE_ID to environment variable.' } if blank?(ENV['CSE_ID'])

        choice(fetch(keyword))
      end

      private

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
        item = res['items'][rand(10)]
        {
          title: item['title'],
          image: item['link'],
          search_result: res['searchInformation']['totalResults']
        }
      end
    end
  end
end
