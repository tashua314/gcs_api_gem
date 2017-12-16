# GcsApiGem

This project is a Ruby lib for Google's Custom Search ENgine API (http://www.google.com/cse).
This is very easy to use but available functions are restricted.

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/gcs_api_gem`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gcs_api_gem'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gcs_api_gem

### Configure

You need to configure KEY and CSE_ID to environment variables.

    $ export KEY=<GOOGLE_API_KEY>
    $ export SCE_ID=<GOOGLE_CUSTOM_SEARCH_ENGINE_ID>

Or write to .bashrc as below:

```.bashrc
export KEY=<GOOGLE_API_KEY>
export SCE_ID=<GOOGLE_CUSTOM_SEARCH_ENGINE_ID>
```

And then execute:

    $ source ~/.bashrc

### Remarks

If you want to know how to get GOOGLE_CUSTOME_SEARCH_ENGINE_ID and GOOGLE_API_KEY, look at [here](https://developers.google.com/custom-search/json-api/v1/overview).
Or see [here](http://ryutamaki.hatenablog.com/entry/2014/01/18/171640).

## Usage

Write in your program as below:

```ruby
GcsApiGem::SearchApu.rondom_image(<keyword>)
```

Then you get a random image searched by keyword.

## Example

```
> GcsApiGem::SearchApi.random_image('cat')
=> {
    :title=>"Cute Cat - Chrome Web Store",
    :image=>"https://lh3.googleusercontent.com/FnN1_Jabl5WITJrHYLGv80r-GNSNAPI_nwrrSgHh8fRUh5fsHFMmPFkPOjaX16H5Pi-Fwotg=w640-h400-e365",
    :search_result=>"320000000"
   }
```

## Response

Response of GcsApiGem::SearchApi.random_image is as below:

| key           | detail                                        |
| ------------- | --------------------------------------------- |
| title         | The title of the web site that got the image. |
| image         | The URL of the got image.                     |
| search_result | Number of images hit in search.               |

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tashua314/gcs_api_gem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct
Everyone interacting in the GcsApiGem project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](./CODE_OF_CONDUCT.md)
