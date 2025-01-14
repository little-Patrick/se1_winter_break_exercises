

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
    message. 
  end
end
