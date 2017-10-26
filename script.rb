records = []
pipe_records = File.new('pipe_delimited.txt')
comma_records = File.new('comma_delimited.txt')
space_records = File.new('space_delimited.txt')
pipe_records.readlines.each do |pipe_record|
  arr = pipe_record.chomp.split(' | ')
  new_record = {}
  new_record['last_name'] = arr[0]
  new_record['first_name'] = arr[1]
  new_record['gender'] = arr[3] == "M" ? "Male" : "Female"
  new_record['date'] = arr[5].split('-').join('/')
  new_record['color'] = arr[4]
  records.push(new_record)
end
comma_records.readlines.each do |comma_record|
  arr = comma_record.chomp.split(', ')
  new_record = {}
  new_record['last_name'] = arr[0]
  new_record['first_name'] = arr[1]
  new_record['gender'] = arr[2]
  new_record['date'] = arr[4]
  new_record['color'] = arr[3]
  records.push(new_record)
end
space_records.readlines.each do |space_record|
  arr = space_record.chomp.split(' ')
  new_record = {}
  new_record['last_name'] = arr[0]
  new_record['first_name'] = arr[1]
  new_record['gender'] = arr[3] == "M" ? "Male" : "Female"
  new_record['date'] = arr[4].split('-').join('/')
  new_record['color'] = arr[5]
  records.push(new_record)
end
puts "Output 1:"
records.sort_by { |record| [record['gender'], record['last_name']] }.each do |record|
  puts record.values.join(' ')
end
puts "\nOutput 2:"
records.sort_by do |record|
  date = record['date'].split('/')
  [date[2], date[0], date[1]]
end.each do |record|
  puts record.values.join(' ')
end
puts "\nOutput 3:"
records.sort { |a, b| b['last_name'] <=> a['last_name'] }.each do |record|
  puts record.values.join(' ')
end
