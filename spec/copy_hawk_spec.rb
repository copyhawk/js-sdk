require 'spec_helper'

describe 'CopyHawk RubyGem Tests' do
  before {ENV["COPYHAWK_SITE_TOKEN"] = 'abc'}
  before {ENV["COPYHAWK_ACCOUNT_TOKEN"] = '123'}
  before {ENV["COPYHAWK_DEFAULT_LANGUAGE"] = 'en'}
  before :all do
    @response = Object.new
    class << @response
      attr_accessor :code
      attr_accessor :body
    end
  end

  let!(:eyas) { CopyHawk.eyas() }

  context 'Initializing' do
    it 'Has a version number' do
      expect(CopyHawk::VERSION).not_to be nil
    end

    it 'Eyas got created correctly' do
      expect(eyas).not_to be nil
      expect(eyas.instance_variable_get(:@token)).to eq('abc')
      expect(eyas.instance_variable_get(:@defaultLang)).to eq('en')
      expect(eyas.instance_variable_get(:@key)).to eq('123')
      expect(eyas.instance_variable_get(:@hawkApi)).not_to be nil
    end
  end

  context 'Preview Scripts' do
    it 'Eyas gets a preview script correctly' do
      @response.code = 200
      @response.body = "Here lies Moe Lester!"
      allow(eyas.instance_variable_get(:@hawkApi)).to receive(:single_staging_script) { @response }
      expect(eyas.preview_copy('abc', 'en')).to eq('Here lies Moe Lester!')
    end

    it 'Eyas cannot find a preview script' do
      @response.code = 404
      @response.body = nil
      allow(eyas.instance_variable_get(:@hawkApi)).to receive(:single_staging_script) { @response }
      expect(eyas.preview_copy('abc', 'en')).to eq("[eyas-error: missing label abc & lang en]")
    end

    it 'Eyas fails getting a preview script' do
      @response.code = 500
      @response.body = nil
      allow(eyas.instance_variable_get(:@hawkApi)).to receive(:single_staging_script) { @response }
      expect(eyas.preview_copy('abc', 'en')).to eq("[eyas-error: fetching label abc & lang en]")
    end

    it 'Eyas has no permission to get a preview script' do
      @response.code = 403
      @response.body = nil
      allow(eyas.instance_variable_get(:@hawkApi)).to receive(:single_staging_script) { @response }
      expect(eyas.preview_copy('abc', 'en')).to eq("[eyas-error: not authorized for label abc & lang en]")
    end
  end

  context 'Live Scripts' do
    it 'Eyas gets a live script correctly' do
      @response.code = 200
      @response.body = "Here lies Moe Lester!"
      allow(eyas.instance_variable_get(:@hawkApi)).to receive(:single_live_script) { @response }
      expect(eyas.single_copy('abc', 'en')).to eq('Here lies Moe Lester!')
    end

    it 'Eyas cannot find a live script' do
      @response.code = 404
      @response.body = nil
      allow(eyas.instance_variable_get(:@hawkApi)).to receive(:single_live_script) { @response }
      expect(eyas.single_copy('abc', 'en')).to eq("[eyas-error: missing label abc & lang en]")
    end

    it 'Eyas fails getting a live script' do
      @response.code = 500
      @response.body = nil
      allow(eyas.instance_variable_get(:@hawkApi)).to receive(:single_live_script) { @response }
      expect(eyas.single_copy('abc', 'en')).to eq("[eyas-error: fetching label abc & lang en]")
    end

    it 'Eyas has no permission to get a live script' do
      @response.code = 403
      @response.body = nil
      allow(eyas.instance_variable_get(:@hawkApi)).to receive(:single_live_script) { @response }
      expect(eyas.single_copy('abc', 'en')).to eq("[eyas-error: not authorized for label abc & lang en]")
    end
  end

  context 'Multiple Live Scripts' do
    it 'Eyas gets multiple live scripts correctly' do
      @response.code = 200
      @response.body = "{['one':'test one', 'two': 'test two']}"
      allow(eyas.instance_variable_get(:@hawkApi)).to receive(:multi_live_scripts) { @response }
      expect(eyas.multi_copy(['abc','def','ghi'], 'en')).to eq("{['one':'test one', 'two': 'test two']}")
    end

    it 'Eyas cannot find multiple live scripts' do
      @response.code = 404
      @response.body = nil
      allow(eyas.instance_variable_get(:@hawkApi)).to receive(:multi_live_scripts) { @response }
      expect(eyas.multi_copy(['abc','def','ghi'], 'en')).to eq("[eyas-error: missing label [*] & lang en]")
    end

    it 'Eyas fails getting multiple live scripts' do
      @response.code = 500
      @response.body = nil
      allow(eyas.instance_variable_get(:@hawkApi)).to receive(:multi_live_scripts) { @response }
      expect(eyas.multi_copy(['abc','def','ghi'], 'en')).to eq("[eyas-error: fetching label [*] & lang en]")
    end

    it 'Eyas has no permission to get multiple live scripts' do
      @response.code = 403
      @response.body = nil
      allow(eyas.instance_variable_get(:@hawkApi)).to receive(:multi_live_scripts) { @response }
      expect(eyas.multi_copy(['abc','def','ghi'], 'en')).to eq("[eyas-error: not authorized for label [*] & lang en]")
    end
  end
end
