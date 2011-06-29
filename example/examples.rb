# coding: utf-8
require '../src/bing_translate.rb'

from = 'es'
to = 'en'
@bt = Bing::Translator.new(from, to, {:app_id => ENV['BING_APP_ID']})
puts @bt.translate('perro')

terms = ['Perro', 'Gato', 'Hola', 'Atlético', 'Perro', 'Jirafa', 'búsqueda', 'traducción', 'gato', 'perro']

terms.each do |t|
  puts @bt.translate(t)
end


to = 'fr'
@bt = Bing::Translator.new(from, to, {:app_id => ENV['BING_APP_ID']})

terms.each do |t|
  puts @bt.translate(t)
end