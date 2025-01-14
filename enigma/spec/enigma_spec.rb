require "./spec/spec_helper.rb"


RSpec.describe Enigma do
  before(:each) do
    @code = Enigma.new
  end

  describe "initializes" do
    it "exists" do
	expect(@code).to be_an_instance_of(Enigma)
    end
    
    it "has an encryption" do
      expect(@code.encrypt("hello world", "02715", "040895")).to eq({encruption: "keder ohulw", key: "02715", date: "040895"})
    end

    it "has an decryption" do
      expect(@code.decrypt("keder ohulw", "02715", "040895")).to eq({decryption: "hello world", key: "02715", date: "040895"})
    end    
  end
end
