require "spec_helper"

describe ContactMailer do
  describe "site_message" do
    let(:mail) { ContactMailer.site_message }

    it "renders the headers" do
      mail.subject.should eq("Site message")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
