require 'spec_helper'

RSpec.describe GcsApiGem do
  it 'has a version number' do
    expect(GcsApiGem::VERSION).not_to be nil
  end

  it 'returns result' do
    res = GcsApiGem::SearchApi.search
    expect(res).to eq(true)
  end
end
