require 'pg'

db = PG.connect(dbname: "films")

result = db.exec "SELECT * FROM films"

result.values # returns array of arrays with values for each row
result.fields # returns name of columns as array

result.ntuples # returns number of rows
result.nfields # returns number of columns

# yields hash of column names and values
result.each do |tuple|
  puts "#{tuple['title']}, #{tuple['year']}"
end

# yields array of values
result.each_row do |tuple|
  puts "#{tuple[1]}, #{tuple[2]}"
end

# returns row at index as hash of column names and values
result[2]

# returns array of values for specified column
result.field_values("duration")

# returns array of values for column at specified index
result.column_values(4)
