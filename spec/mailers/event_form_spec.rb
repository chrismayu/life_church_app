require "spec_helper"

describe EventForm do
  describe "thank_you_we_have_received" do
    let(:mail) { EventForm.thank_you_we_have_received }

    it "renders the headers" do
      mail.subject.should eq("Thank you we have received")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "new_form_submitted" do
    let(:mail) { EventForm.new_form_submitted }

    it "renders the headers" do
      mail.subject.should eq("New form submitted")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
