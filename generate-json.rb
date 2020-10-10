require "json"
require "digest"

# These videos contain a baked-in text with their meaning. This text will be covered up in Anki.
containtext = IO.readlines(File.expand_path('containtext', File.dirname(__FILE__))).map{|line| line.split(" ").first}

hash = JSON.load(File.read(File.expand_path("German_Sign_Language/German_Sign_Language.json", File.dirname(__FILE__))))

hash["notes"] = []

entries = IO.readlines(File.expand_path("entries", File.dirname(__FILE__))).map do |line|
    line.chomp.split("\t", -1)
end

entries = entries.group_by{|e| e[1]+e[2].to_s}.map{|meaning, e| [e[0][1], e[0][2], e.map{|e2| "https://signdict.org"+e2[0].gsub("entry", "embed")}] }

entries.each do |e|
    meaning, note, videos = e
    note = note.to_s
    while videos.size < 6
        videos << ""
    end

    ct = videos.map{|v| containtext.include?(v.split("/").last) ? "yes" : ""}

    entry = {
        "__type__" => "Note",
        "data" => "",
        "fields" => [
            meaning,
            note,
        ]+videos+ct,
        "flags" => 0,
        "guid" => Digest::SHA1.hexdigest(meaning+note)[8..17],
        "note_model_uuid" => "1c00f1a4-b468-11e8-9e8e-448500519c3a",
        "tags" => []
    }

    hash["notes"] << entry
end

json = JSON.pretty_generate(hash)
json.gsub!("  ", "    ")
json.gsub!(/\[\s+\]/, "[]")

IO.write(File.expand_path("German_Sign_Language/German_Sign_Language.json", File.dirname(__FILE__)), json)
