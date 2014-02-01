require 'spec_helper'

describe Announcement do
 
 FactoryGirl.build(:about) 
  
 
  it "displays active announcements" do
    Announcement.create! message: "Hello World", starts_at: 1.hour.ago, ends_at: 1.hour.from_now
    Announcement.create! message: "Upcoming", starts_at: 10.minutes.from_now, ends_at: 1.hour.from_now
    visit root_path
    page.should have_content "Hello World"
    page.should_not have_content "Upcoming"
  end
 
  it "has current scope" do
    past = Announcement.create! message: "Hello World", starts_at: 1.day.ago, ends_at: 1.hour.ago
    current = Announcement.create! message: "Hello World", starts_at: 1.hour.ago, ends_at: 1.day.from_now
    upcoming = Announcement.create! message: "Hello World", starts_at: 1.hour.from_now, ends_at: 1.day.from_now
    Announcement.current.should eq([current])
  end
  
  
  it "displays active announcements" do
    Announcement.create! message: "Hello World", starts_at: 1.hour.ago, ends_at: 1.hour.from_now
    Announcement.create! message: "Upcoming", starts_at: 10.minutes.from_now, ends_at: 1.hour.from_now
    visit root_path
    page.should have_content "Hello World"
    page.should_not have_content "Upcoming"
    click_on "x"
    page.should_not have_content "Hello World"
  end
  
  
end


