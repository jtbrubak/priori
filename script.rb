def run
  records = []
  records.concat(pipe_records)
  records.concat(comma_records)
  records.concat(space_records)
  output(records)
end

def pipe_records
  File.readlines('pipe_delimited.txt').map do |pipe_record|
    arr = pipe_record.chomp.split(' | ')
    {
      last_name: arr[0],
      first_name: arr[1],
      gender: arr[3] == "M" ? "Male" : "Female",
      date: arr[5].split('-').join('/'),
      color: arr[4]
    }
  end
end

def comma_records
  File.readlines('comma_delimited.txt').map do |comma_record|
    arr = comma_record.chomp.split(', ')
    {
      last_name: arr[0],
      first_name: arr[1],
      gender: arr[2],
      date: arr[4],
      color: arr[3]
    }
  end
end

def space_records
  File.readlines('space_delimited.txt').map do |space_record|
    arr = space_record.chomp.split(' ')
    {
      last_name: arr[0],
      first_name: arr[1],
      gender: arr[3] == "M" ? "Male" : "Female",
      date: arr[4].split('-').join('/'),
      color: arr[5]
    }
  end
end

def output(records)
  sorts = [first_sort(records), second_sort(records), third_sort(records)]
  sorts.each_with_index do |sort, i|
    puts "Output #{i + 1}:"
    sort.each { |record| puts record.values.join(' ') }
    puts "\n"
  end
end

def first_sort(records)
  records.sort_by { |record| [record[:gender], record[:last_name]] }
end

def second_sort(records)
  records.sort_by do |record|
    date = record[:date].split('/')
    [date[2], date[0], date[1]]
  end
end

def third_sort(records)
  records.sort { |a, b| b[:last_name] <=> a[:last_name] }
end

run
