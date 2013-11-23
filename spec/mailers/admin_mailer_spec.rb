require "spec_helper"

describe AdminMailer do
  describe "new_member_signed_up" do
    let(:mail) { AdminMailer.new_member_signed_up }

    it "renders the headers" do
      mail.subject.should eq("New member signed up")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
