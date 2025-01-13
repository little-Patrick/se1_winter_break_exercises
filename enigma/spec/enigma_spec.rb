require "./spec/spec_helper.rb'


RSpec.describe Enigma do
  before(:each) do
    @code = Enigma.new
  end

  describe "initialize" do
    it "exists" do
	expect(@code).to be_an_instance_of(Enigma)
    end
    
  end
end
