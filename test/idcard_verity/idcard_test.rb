require File.expand_path("../../test_helper", __FILE__)

describe IdcardVerity::Idcard do  

  describe "when the card length is 15 and sync right" do  
    it "must respond true" do 
      idcard = IdcardVerity::Idcard.new(340207570821355) 
      idcard.valid?.must_equal true  
    end  
  end  

  describe "when the card length is 15 and sync wrong" do  
    it "must respond false" do  
      idcard = IdcardVerity::Idcard.new(340207571421315) 
      idcard.valid?.must_equal false
    end  
  end  

  describe "when the card length is 18 and sync right" do  
    it "must respond true" do  
      idcard = IdcardVerity::Idcard.new(341202197107252705) 
      idcard.valid?.must_equal true
    end  
  end 

  describe "when the card length is 18 and sync wrong" do  
    it "must respond false" do  
      idcard = IdcardVerity::Idcard.new(341202197116252705) 
      idcard.valid?.must_equal false
    end  
  end 

  describe "when the card length is not 15 or 18" do  
    it "must respond false" do  
      idcard = IdcardVerity::Idcard.new(3412021971072527) 
      idcard.valid?.must_equal false
    end  
  end  
end  