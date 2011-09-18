# coding: utf-8
require '../lib/bing_translate.rb'
require "test/unit"

class TestBingTranslate < Test::Unit::TestCase
  
  def test_spanish
    from = 'es'
    to = 'en'
    @bt = Bing::Translator.new(from, to, {:app_id => ENV['BING_APP_ID']})
    
    assert_equal('dog', @bt.translate('perro') )
    assert_equal('Dog', @bt.translate('Perro') )
    assert_equal('Hello', @bt.translate('Hola') )
    assert_equal('Athletic', @bt.translate('Atlético') )
    assert_equal('Giraffe', @bt.translate('Jirafa') )
    assert_equal('search', @bt.translate('búsqueda') )
    assert_equal('translation', @bt.translate('traducción') )
  end
    
  def test_french
    from = 'es'
    to = 'fr'
    @bt = Bing::Translator.new(from, to, {:app_id => ENV['BING_APP_ID']})

    assert_equal('chien', @bt.translate('perro') )
    
  end

end