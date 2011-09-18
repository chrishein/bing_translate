require "httparty"

module Bing
  class Translator
    include HTTParty
    base_uri "http://api.bing.net/"
    default_params 'Version' => '2.2', 'Market' => 'en-us', 'Sources' => 'Translation'
    
    def initialize(from, to='en', options={})
      @options = {
        :cache => true
      }.merge(options)
      
      raise(MissingAppId) if @options[:app_id].nil?
      raise(MissingFromLanguage) if not @from.nil?
      
      @app_id = @options[:app_id]
      @from = from
      @to = to
      @cache_terms = Hash.new
      
    end
    
    def self.Exception(*names)
      cl = Module === self ? self : Object
      names.each {|n| cl.const_set(n, Class.new(Exception))}
    end
    
    Exception :TranslateServerIsDown, :InvalidResponse, :MissingAppId,
              :MissingFromLanguage
    
    def translate(text, options={})
      options = @options.merge(options)
      
      return @cache_terms[text] if options[:cache] and @cache_terms[text]

      params = { :query => { 'Query' => text, 'AppId' => @app_id,
                                    'Translation.SourceLanguage' => @from,
                                    'Translation.TargetLanguage' => @to
                            }
                }
      response = self.class.get('/json.aspx', params)
      response = (response && response.parsed_response) ? response.parsed_response : nil
      raise(TranslateServerIsDown) if (!response || response.empty?)
      raise(InvalidResponse, response["SearchResponse"]) if not response["SearchResponse"]['Translation']['Results'][0]['TranslatedTerm']
      to_text = response['SearchResponse']['Translation']['Results'][0]['TranslatedTerm']
      @cache_terms[text] = to_text if options[:cache]
      return to_text
    end
    
  end
end
