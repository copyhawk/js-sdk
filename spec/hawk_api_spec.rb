require 'spec_helper'

describe 'CopyHawk API Ruby Gem Tests' do
  before {@token = 'abc'}
  before {@key = '123'}
  before {@lang = 'en'}

  let!(:api) { HawkApi.new }

  context 'Initializing API' do
    it 'Is not null' do
      expect(api).not_to be nil
    end
  end

  context 'Get Single Scripts Through API' do
    it 'Gets single script successfully' do
      #pending("is implemented but waiting")
      expect(api.getSingleLiveScript(@token, @key, "testlabel", @lang).body).not_to be_empty
    end

    it 'Gets 404 when script is missing' do
      #pending("is implemented but waiting")
      expect(api.getSingleLiveScript(@token, @key, "madeUpLabel", @lang).code).to eq(404)
    end
  end

  context 'Get Preview Scripts Through API' do
    it 'Gets single script successfully' do
      #pending("is implemented but waiting")
      expect(api.getSingleStagingScript(@token, @key, "toStage", @lang).body).not_to be_empty
    end

    it 'Gets 404 when script is missing' do
      #pending("is implemented but waiting")
      expect(api.getSingleStagingScript(@token, @key, "madeUpLabel", @lang).code).to eq(404)
    end
  end

  context 'Get Muliple Live Scripts Through API' do
    it 'Gets multi script successfully' do
      #pending("is implemented but waiting")
      expect(api.getMultiLiveScripts(@token, @key, ['testlabel','testlabel2'], @lang).body).not_to be_empty
    end

    it 'Gets 404 when any script is missing' do
      #pending("is implemented but waiting")
      expect(api.getMultiLiveScripts(@token, @key, ["madeUpLabel", "testlabel","testlabel2"], @lang).code).to eq(404)
    end

    it 'Gets 400 when params are missing' do
      #pending("is implemented but waiting")
      expect(api.getMultiLiveScripts(@token, "", ["testlabel","testlabel2"], nil).code).to eq(400)
    end
  end
end
