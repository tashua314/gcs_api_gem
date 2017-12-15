require 'spec_helper'

RSpec.describe GcsApiGem do
  it 'has a version number' do
    expect(GcsApiGem::VERSION).not_to be nil
  end

  it 'returns success result' do
    res = GcsApiGem::SearchApi.search
    expect(res).to eq(true)
  end

  it 'search result was 0' do
  end

  it 'miss KEY' do
  end

  it 'miss CSE_ID' do
  end
end
