

class Enigma
  attr_reader :message, :key, :date
  
  def initialize(message, key = random_key, date = Date.today.strftime("%d%m%y"))
    @message = message
    @key = key 
    @date = date
  end

  def encrypt
    offset
  end

  def decrypt
  end

  def random_key
    rand(1000..99999)
  end

  def shift_key
    key_split = @key.split("")
    keys = {
      A: key_split[0].concat(key_split[1])
      B: key_split[1].concat(key_split[2])
      C: key_split[2].concat(key_split[3])
      D: key_split[3].concat(key_split[4])
    }
    return keys
  end

  def shift_date
    square = @date.to_i ** 2
    date_split = square.to_s.split("")
    date_offset = {
      A: date_split[-4]
      B: date_split[-3]
      C: date_split[-2]
      D: date_split[-1]
    }
    return date_offset
  end
  
  def offset
    key.each_with_index {|key| hash[key] = key}
    letter_hash = {"a" => "a", "b" => "b", "c" => "c", "d" =>
    letter_key = ("a".."z").to_a << " "
    key_shift = shift_key
    date_shift = shift_date
  end 
end
