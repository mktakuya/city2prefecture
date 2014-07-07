require 'open-uri'
require 'nokogiri'

url = "http://elze.tanosii.net/d/kenmei.htm"
page = Nokogiri::HTML(open(url))
table = page.search('table')

table.search('tr').each_with_index do |tr, i|
  unless i == 0
    prs[tr.search('td')[1].text] = tr.search('td')[2].text
  end
end

puts prs
