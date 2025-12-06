#puts "#{ARGV}"

targetFile = ARGV[0]

dayState = [
  { dial_pointer: 50,
    password: 0,
    spinning: false }
]

File.readlines(targetFile).each do |scriptLine|
  case scriptLine.chomp
  # DAY 1
  when /^RESET_DIAL/
    dayState[0][:dial_pointer] = 50
  when /^PRINT "(.*)"/
    message = Regexp.last_match().captures[0]
    puts message.gsub(/\$PASSWORD/, dayState[0][:password].to_s)
  when /^SPIN >>$/
    dayState[0][:spinning] = true
  when /^<< SPUN$/
    dayState[0][:spinning] = false
  when /^(L|R)(\d+)$/
    vector = Regexp.last_match().captures[0] == "R" ? 1 : -1
    magn

  else
  end
end