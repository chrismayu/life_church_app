require "spec_helper"

describe MemberMailer do
  describe "your_approved" do
    let(:mail) { MemberMailer.your_approved }

    it "renders the headers" do
      mail.subject.should eq("Your approved")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
