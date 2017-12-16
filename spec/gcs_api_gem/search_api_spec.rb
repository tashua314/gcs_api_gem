require 'spec_helper'

RSpec.describe GcsApiGem::SearchApi do
  it 'returns success result' do
    allow(GcsApiGem::SearchApi).to receive(:fetch).and_return(success_1_result)
    res = GcsApiGem::SearchApi.image('test')
    expect(res).to eq(
      image: 'http://test',
      title: 'test',
      search_result: '1'
    )
  end

  it 'search result was 0' do
    allow(GcsApiGem::SearchApi).to receive(:fetch).and_return(success_0_result)
    res = GcsApiGem::SearchApi.image('test')
    expect(res).to eq(result_0_output)
  end

  it 'miss KEY' do
    allow(GcsApiGem::SearchApi).to receive(:key_is_ng?).and_return(true)
    res = GcsApiGem::SearchApi.image('test')
    expect(res).to eq(error: 'Please set KEY to environment variable.')
  end

  it 'miss CSE_ID' do
    allow(GcsApiGem::SearchApi).to receive(:cse_id_is_ng?).and_return(true)
    res = GcsApiGem::SearchApi.image('test')
    expect(res).to eq(error: 'Please set CSE_ID to environment variable.')
  end
end

def success_1_result
  {
    'items' => [{
      'title' => 'test',
      'link' => 'http://test'
    }],
    'searchInformation' => {
      'totalResults' => '1'
    }
  }
end

def success_0_result
  {
    'searchInformation' => {
      'totalResults' => '0'
    }
  }
end

def result_0_output
  { error: 'Search result was 0.' }
end
