require 'csv'
require 'pry'

# open the csv file
# file = File.new("test.csv", 'r')

arr_of_arrs = CSV.read("test.csv")
restaurants = []
CSV.foreach(arr_of_arrs, :headers => true) do |row|
	restaurants << row
	binding.pry
# row.delete("INSPDATE")
 
#   # row.delete("ACTION")
#   # row.delete("VIOLCODE")
#   # row.delete("SCORE")
#   # row.delete("GRADEDATE")
#   # row.delete("RECORDDATE")
end

# outfile = File.new("restaurants_json.json", "w")
# outfile.write(restaurants.to_json)
# outfile.close