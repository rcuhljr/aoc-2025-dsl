sample = <<'DATA'
11-22,95-115,998-1012,1188511880-1188511890,222220-222224,
1698522-1698528,446443-446449,38593856-38593862,565653-565659,
824824821-824824827,2121212118-2121212124
DATA

actual = <<'DATA'
  269351-363914,180-254,79-106,771-1061,4780775-4976839,7568-10237,33329-46781,127083410-127183480,19624-26384,9393862801-9393974421,2144-3002,922397-1093053,39-55,2173488366-2173540399,879765-909760,85099621-85259580,2-16,796214-878478,163241-234234,93853262-94049189,416472-519164,77197-98043,17-27,88534636-88694588,57-76,193139610-193243344,53458904-53583295,4674629752-4674660925,4423378-4482184,570401-735018,280-392,4545446473-4545461510,462-664,5092-7032,26156828-26366132,10296-12941,61640-74898,7171671518-7171766360,3433355031-3433496616
DATA



def solveA(input)
  invalids = []
  input.gsub!(/\r|\n/,'')
  input.scan(/(\d+)-(\d+)/).map do |head, tail|
    (head.to_i..tail.to_i).map do |candidate|
      candidate = candidate.to_s
      next if candidate.to_s.size % 2 == 1
      invalids << candidate.to_i if candidate[0..(candidate.to_s.size/2-1)] == candidate[(candidate.to_s.size/2)..]
    end
  end
  return invalids.sum()
end

def solveB(input)
  invalids = []
  input.gsub!(/\r|\n/,'')
  input.scan(/(\d+)-(\d+)/).map do |head, tail|
    (head.to_i..tail.to_i).map do |candidate|
      candidate = candidate.to_s
      (1..candidate.length/2).map do |len|
        next if candidate.size % len != 0
        next if invalids.last == candidate
        chunks = candidate.each_char.each_slice(len).map(&:join)
        if chunks.all? {|x| x == chunks.first}
          invalids << candidate
        end
      end
    end
  end
  return invalids.map(&:to_i).sum()
end




# puts solveA(sample)
# puts solveA(actual)


puts solveB(sample)
puts solveB(actual)