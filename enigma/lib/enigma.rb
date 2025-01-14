

class Enigma

  def encrypt(message, key = random_key, date = Date.today.strftime("%d%m%y"))
    encryption = shift_key(message, key)
    # hash with encription: 
    #  		key:
    # 		date:

  end

  def decrypt(ciphertext, key = '', date = Date.today.strftime("%d%m%y"))
    # hash decruption:
    #	   key:
    # 	   date:
  end

  def random_key
    rand(1000..99999)
  end

  def shift_key(message, key)
    binding.pry
    key_split = keys.split("")
    a = key_split[0].concat(key_split[1])
    b = key_split[2].concat(key_split[3])
    c = key_split[3].concat(key_split[4])
    d = key_split[4].concat(key_split[5])
  end
end
