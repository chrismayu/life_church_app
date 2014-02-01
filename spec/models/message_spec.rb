require 'spec_helper'

describe Message   do
 
 
      it "is Factory is valid" do 
         FactoryGirl.build(:message).should be_valid
      end 
  
      it "is invalid without a Name" do  
        FactoryGirl.build(:message, name: nil).should_not be_valid 
      end 
  
      it "is invalid without a Email" do  
        FactoryGirl.build(:message, email: nil).should_not be_valid 
      end 
      
      it "is invalid without a Subject" do  
        FactoryGirl.build(:message, subject: nil).should_not be_valid 
      end 
  
      it "is invalid without a Body" do  
        FactoryGirl.build(:message, body: nil).should_not be_valid 
      end 
      
      it "is invalid without a Proper Email" do  
        FactoryGirl.build(:message, email: "chid").should_not be_valid 
      end 
      
      it "is invalid Name with too many characters" do  
        FactoryGirl.build(:message, name: "fvsfvlsdfhbvlshjdfbvlshdfbvlhsdfvlhsdfhlvgsdflhvgsldhjfvlsdfhgvlshjdfgvlsjdhfgvlsjdhfgvlsdjhfgvlsdjhfvglsdfjhvglsfhsdflhvlsdfkjvhlsdfkjvhlsdfkjhvlskdjfhvlskjfhvlskdjfhvlsdkjfhvlsdkjfhvlsdkfjhvlskdfjhvlskjffvsfvlsdfhbvlshjdfbvlshdfbvlhsdfvlhsdfhlvgsdflhvgsldhjfvlsdfhgvlshjdfgvlsjdhfgvlsjdhfgvlsdjhfgvlsdjhfvglsdfjhvglsfhsdflhvlsdfkjvhlsdfkjvhlsdfkjhvlskdjfhvlskjfhvlskdjfhvlsdkjfhvlsdkjfhvlsdkfjhvlskdfjhvlskjfvsfvlsdfhbvlshjdfbvlshdfbvlhsdfvlhsdfhlvgsdflhvgsldhjfvlsdfhgvlshjdfgvlsjdhfgvlsjdhfgvlsdjhfgvlsdjhfvglsdfjhvglsfhsdflhvlsdfkjvhlsdfkjvhlsdfkjhvlskdjfhvlskjfhvlskdjfhvlsdkjfhvlsdkjfhvlsdkfjhvlskdfjhvlskjdhvlskjdfhvlkjsdfchid").should_not be_valid 
      end 
      
      it "is invalid Subject with too many characters" do  
        FactoryGirl.build(:message, subject: "fvsfvlsdfhbvlshjdfbvlshdfbvlhsdfvlhsdfhlvgsdflhvgsldhjfvlsdfhgvlshjdfgvlsjdhfgvlsjdhfgvlsdjhfgvlsdjhfvglsdfjhvglsfhsdflhvlsdfkjvhlsdfkjvhlsdfkjhvlskdjfhvlskjfhvlskdjfhvlsdkjfhvlsdkjfhvlsdkfjhvlskdfjhvlskjffvsfvlsdfhbvlshjdfbvlshdfbvlhsdfvlhsdfhlvgsdflhvgsldhjfvlsdfhgvlshjdfgvlsjdhfgvlsjdhfgvlsdjhfgvlsdjhfvglsdfjhvglsfhsdflhvlsdfkjvhlsdfkjvhlsdfkjhvlskdjfhvlskjfhvlskdjfhvlsdkjfhvlsdkjfhvlsdkfjhvlskdfjhvlskjfvsfvlsdfhbvlshjdfbvlshdfbvlhsdfvlhsdfhlvgsdflhvgsldhjfvlsdfhgvlshjdfgvlsjdhfgvlsjdhfgvlsdjhfgvlsdjhfvglsdfjhvglsfhsdflhvlsdfkjvhlsdfkjvhlsdfkjhvlskdjfhvlskjfhvlskdjfhvlsdkjfhvlsdkjfhvlsdkfjhvlskdfjhvlskjdhvlskjdfhvlkjsdfchid").should_not be_valid 
      end 
end
