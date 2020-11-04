require "open-uri"
# $gem install nokogiri
require "nokogiri"

File.open(File.expand_path("entries", File.dirname(__FILE__)), 'w') { |file| file.write("") }
(("A".."Z").to_a + ["0-9"]).each do |letter|
    oldcontent = ''
    1.upto(100) do |pageno|
        uri = "https://signdict.org/entry?letter=#{letter}&page=#{pageno}"
        page = URI.open(uri)
        content = page.read
        break if content == oldcontent
        oldcontent = content
        new_entries = content.scan(/"so-search-result--link" href="\/entry\/(\d+)-[^"]+">([^<]+)</)
        new_entries.each do |id, meaning|
            uri = "https://signdict.org/entry/#{id}"
            URI.open(uri) do |page2|
                content = page2.read

                n = Nokogiri::HTML(content)
                meaning = n.css(".so-video-details--headline").text
                note = n.css(".so-video-details--headline + p").text
                if note.length > 0
                  note = "\t" + note
                end
                variants = n.css(".sc-sidebar .so-video-list--item--thumbnail a")
                variants.each do |v|
                    video = v["href"]
                    puts "#{video}\t#{meaning}\t#{note}"
                    File.open(File.expand_path("entries", File.dirname(__FILE__)), 'a+') { |file| file.write("#{video}\t#{meaning}#{note}\n") }
                    STDOUT.flush
                end
            end
        end
        break if new_entries.empty?
    end
end

# Und hier fügen wir bislang fehlende Entries hinzu, die mit Umlauten beginnen
umlautlinks = IO.readlines(File.expand_path('Umlaute', File.dirname(__FILE__)),chomp: true).uniq
umlautlinks.each do |ulink|
  URI.open(ulink) do |page2|
      # puts ulink
      content = page2.read

      n = Nokogiri::HTML(content)
      meaning = n.css(".so-video-details--headline").text
      note = n.css(".so-video-details--headline + p").text
      if note.length > 0
        note = "\t" + note
      end
      variants = n.css(".sc-sidebar .so-video-list--item--thumbnail a")
      variants.each do |v|
          video = v["href"]
          # puts "#{video}\t#{meaning}\t#{note}"
          File.open(File.expand_path("entries", File.dirname(__FILE__)), 'a+') { |file| file.write("#{video}\t#{meaning}#{note}\n") }
          STDOUT.flush
      end
  end
end

entries = IO.readlines(File.expand_path('entries', File.dirname(__FILE__))).uniq
File.open(File.expand_path("entries", File.dirname(__FILE__)), 'w') { |file| file.write("") }
File.open(File.expand_path("entries", File.dirname(__FILE__)), 'a+') do |f|
  entries.each { |element| f.puts(element) }
end
