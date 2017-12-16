module GcsApiGem
  # SearchApi
  class SearchApi
    # Decide to what range of page you want to acquire
    SEARCH_RANGE = 3

    def initialize
      @items = []
      @search_result = nil
      @keyword = nil
      @start_index = nil
    end

    # Select one piece randomly from images searched by keyword
    def random_image(keyword)
      return { error: 'Please set KEY to environment variable.' } if key_is_ng?
      return { error: 'Please set CSE_ID to environment variable.' } if cse_id_is_ng?

      choice(keyword)
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
        'start' => rand(SEARCH_RANGE) + 1,
        'imgType' => 'photo'
      }
    end

    def fetch(keyword)
      client = HTTPClient.new
      res = client.get(url, query(keyword))
      JSON.parse res.body
    end

    def choice(keyword)
      if @keyword != keyword
        @keyword = keyword
        pull_data
      end
      formatted_item(select_item)
    rescue => e
      return { error: e.message }
    end

    def pull_data
      p 'do pull_data'
      res = fetch(@keyword)
      check_error(res)

      @items = res['items']
      @search_result = res['searchInformation']['totalResults'].to_i
      @start_index = res['queries']['request'][0]['startIndex']
    end

    def check_error(res)
      raise res['error'].to_s unless blank?(res['error'])
      raise 'Search result was 0.' if count_zero?(res)
    end

    def select_item
      pull_data if @items.count.zero?

      index = [*(0..@items.count - 1)].sample
      item = @items[index]
      @items.delete_at(index)
      item
    end

    def blank?(obj)
      obj.nil? || obj.empty?
    end

    def formatted_item(item)
      {
        keyword: @keyword,
        title: item['title'],
        image: item['link'],
        search_result: @search_result,
        start_index: @start_index
      }
    end

    def count_zero?(res)
      res['searchInformation']['totalResults'].to_i.zero?
    end
  end
end
