require 'rubygems'
require 'mechanize'
require 'nokogiri'
require 'open-uri'

module LexFoodTrux
  class Parse
    def get
      doc = Nokogiri::HTML(open("http://lexbeerscene.com/foodtruckevents"))
      doc.css('div.wrapper div.container div.row a')
    end
  end
end

ltf = LexFoodTrux::Parse.new()

ltf.get.each do |l|
  puts "#{l.text} --- #{l['href']}"
end
