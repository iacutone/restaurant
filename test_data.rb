require 'pry'
require 'json'



infile = File.new("webextract.txt", "r")

legend = infile.first.strip!.split(',')

legend.map! { |n| n.strip.gsub('"', "") }


restaurants = []

count = 0

number = 0

infile.each do |line|
  begin
    stats = line.strip.split(",")
  rescue
    next
  end
  hash = {}
  stats.each do |item|
    if item
      begin
        hash[legend[stats.index(item)].strip.gsub('"', "").downcase.to_sym] = item.strip.gsub('"', "").downcase
      rescue
        next
      end
    else
      next
    end
  end

  hash.delete(:camis)
  hash.delete(:action)
  hash.delete(:violcode)
  hash.delete(:boro)
  hash.delete(:gradedate)
  hash.delete(:cuisinecode)
  hash.delete(:recorddate)
  hash.delete(:inspdate)
  hash.delete(:score)

  restaurants << hash
end


# fJson = File.open("public/temp.json","w")
# fJson.write(tempHash)
# fJson.close

outfile = File.open("restaurants_json.json", "w")
outfile.write(restaurants.to_json)
outfile.close