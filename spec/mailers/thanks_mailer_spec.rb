require "spec_helper"

describe ThanksMailer do
  describe "thank_you" do
    let(:mail) { ThanksMailer.thank_you }

    it "renders the headers" do
      mail.subject.should eq("Thank you")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "thank_you_us" do
    let(:mail) { ThanksMailer.thank_you_us }

    it "renders the headers" do
      mail.subject.should eq("Thank you us")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
