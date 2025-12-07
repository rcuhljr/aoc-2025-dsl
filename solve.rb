#puts "#{ARGV}"

targetFile = ARGV[0]

debug_flag = false

dayState = [
  { dial_pointer: 50,
    password: 0,
    spinning: false,
    alternate_mode: false }
]

File.readlines(targetFile).each do |scriptLine|
  case scriptLine.chomp
  when /^#/
    next
  # DAY 1
  when /^RESET_DIAL/
    dayState[0][:dial_pointer] = 50
    dayState[0][:password] = 0
  when /^PRINT "(.*)"/
    message = Regexp.last_match().captures[0]
    puts message.gsub(/\$PASSWORD/, dayState[0][:password].to_s)
  when /^SPIN >>$/
    debug_msg = ""
    dayState[0][:spinning] = true
  when /^<< SPUN$/
    dayState[0][:spinning] = false
  when /^DEBUG ON$/
    debug_flag = true
  when /^DEBUG OFF$/
    debug_flag = false
  when /^PASSWORD_MODE ALTERNATE$/
    dayState[0][:alternate_mode] = true
  when /^PASSWORD_MODE PRIMARY$/
    dayState[0][:alternate_mode] = false
  when /^(L|R)(\d+)$/
    next unless dayState[0][:spinning]
    vector = Regexp.last_match().captures[0] == "R" ? 1 : -1
    magnitude = Regexp.last_match().captures[1].to_i
    old_target = dayState[0][:dial_pointer]
    pointer_target = (dayState[0][:dial_pointer] + vector * magnitude)
    dayState[0][:dial_pointer] = pointer_target % 100
    if dayState[0][:alternate_mode]
      if vector < 0
        pointer_target += 100 if pointer_target < 0 && old_target == 0
      else
        pointer_target -= 100 if pointer_target > 0 && pointer_target % 100 == 0
      end
      puts "Went past 0 #{(pointer_target/100).abs} times" if debug_flag && (pointer_target/100).abs > 0
      dayState[0][:password] += (pointer_target/100).abs
    end
    dayState[0][:password] += 1 if dayState[0][:dial_pointer] == 0
    puts "(#{dayState[0][:password]})Rotated #{scriptLine.chomp} from #{old_target} to #{dayState[0][:dial_pointer]}" if debug_flag
  else
  end
end