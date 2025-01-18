require "./spec/spec_helper.rb"


RSpec.describe Enigma do
  before(:each) do
    @code = Enigma.new("hello world", "02715", "040895")
  end

  describe "initializes" do
    it "exists" do
    	expect(@code).to be_an_instance_of(Enigma)
      binding.pry 
    end
    
    it "has an encryption" do
      expect(@code.encrypt).to eq({encruption: "keder ohulw", key: "02715", date: "040895"})
    end

    xit "has an decryption" do
      expect(@code.decrypt).to eq({decryption: "hello world", key: "02715", date: "040895"})
    end    
  end
end

#    Array#rotate
#    Date#strftime
#    Date::today
#    Enumerator#with_index

