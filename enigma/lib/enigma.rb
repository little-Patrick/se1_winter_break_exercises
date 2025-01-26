

class Enigma
  attr_reader :message, :key, :date
  
  def initialize(message, key = random_key, date = Date.today.strftime("%d%m%y"))
    @message = message
    @key = key 
    @date = date
  end

  def encrypt
    message_shift
  end

  def decrypt
    reverse_shift
  end
  
  private
  def random_key
    rand(1000..99999)
  end

  def shift_key
    key_split = @key.split("")
    keys = {
      A: key_split[0].concat(key_split[1]),
      B: key_split[1].concat(key_split[2]),
      C: key_split[2].concat(key_split[3]),
      D: key_split[3].concat(key_split[4])
    }
    return keys
  end

  def shift_date
    square = @date.to_i ** 2
    date_split = square.to_s.split("")
    date_offset = {
      A: date_split[-4],
      B: date_split[-3],
      C: date_split[-2],
      D: date_split[-1]
    }
    return date_offset
  end
  
  def final_key
    final = Hash.new(0)
    shift_key.keys.each {|x| final[x] = (shift_key[x].to_i + shift_date[x].to_i)}
    final
  end

  def offset(positive = true)
    hash_letter_key = {} 
    letter_key = letters 
    letter_key.each_with_index {|key, value| hash_letter_key[key] = key}
  
    a_keys = hash_letter_key.clone
    b_keys = hash_letter_key.clone
    c_keys = hash_letter_key.clone
    d_keys = hash_letter_key.clone
    
    if positive
      a_offset = letter_key.rotate(final_key[:A])
      b_offset = letter_key.rotate(final_key[:B])
      c_offset = letter_key.rotate(final_key[:C])
      d_offset = letter_key.rotate(final_key[:D])
    else
      a_offset = letter_key.rotate(-final_key[:A])
      b_offset = letter_key.rotate(-final_key[:B])
      c_offset = letter_key.rotate(-final_key[:C])
      d_offset = letter_key.rotate(-final_key[:D])
    end 
    a_keys.keys.each_with_index {|key, index| a_keys[key] = a_offset[index]}
    b_keys.keys.each_with_index {|key, index| b_keys[key] = b_offset[index]}
    c_keys.keys.each_with_index {|key, index| c_keys[key] = c_offset[index]}
    d_keys.keys.each_with_index {|key, index| d_keys[key] = d_offset[index]}
    
    offset = {
      A: a_keys,
      B: b_keys,
      C: c_keys,
      D: d_keys
      }
      return offset
  end 
  
  def message_shift
    encryption = []
    @message.split('').each_slice(4) do |slice|
      encryption << offset[:A][slice[0]] 
      encryption << offset[:B][slice[1]]
      encryption << offset[:C][slice[2]]
      encryption << offset[:D][slice[3]]
    end
    encryption.join("")
  end
  
  def reverse_shift
    decryption = []
    @message.split('').each_slice(4) do |slice|
      decryption << offset(false)[:A][slice[0]] if slice[0]
      decryption << offset(false)[:B][slice[1]] if slice[1]
      decryption << offset(false)[:C][slice[2]] if slice[2]
      decryption << offset(false)[:D][slice[3]] if slice[3]
    end
    decryption.join("")
  end

  def letters
    downcase = ("a".."z").to_a
    upcase = ("A".."Z").to_a
    numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    special = ["`", "~", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "_", "=", "+", "[", "{", "]", "{", "|", "|", ";", ",", "<", ".", ">", "/", "?"] 
    letters = [downcase, upcase, numbers, special].flatten
  end
end











