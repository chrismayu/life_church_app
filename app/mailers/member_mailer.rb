class MemberMailer < ActionMailer::Base
  default from: ENV["SITE_EMAIL"]

  require 'mandrill'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.member_mailer.your_approved.subject
  #
   def your_approved(member)
 #  @member = member
  #mail(to: member.email, :subject => "Welcome to LifeChurch")
  
  subject = "Welcome to LifeChurch"
  body = "Your account has been approved and ready for use: #{ENV["WEBSITE"]}"
  
  send_using_Mandrill(member, subject, body)
 end
  
  def welcome_email(member)
    #@member = member
    #mail(to: member.email, :subject => "Welcome to LifeChurch WebSite")
    subject = "Welcome to LifeChurch WebSite"
    body = "Your application has been sent to the Church and we will be in contact once you have been approved.
Until then enjoy the rest of our site."
    
    send_using_Mandrill(member, subject, body)
  end
  
   def send_using_Mandrill(member, subject, body)
   
    
      @member = member
 
      mandrill = Mandrill::API.new ENV["MANDRILL_API_KEY"]
      template_name = "Member_Contact"
      template_content = [{"name"=>"fullname", "content"=>"#{member.name}"}]
      member = {"google_analytics_campaign"=>"member.from_email@example.com",
       "url_strip_qs"=>nil,
       "from_name"=>"LifeChurch",
       "subject"=>"#{subject}",
       "recipient_metadata"=>
          [{"rcpt"=>"#{member.email}", "values"=>{"user_id"=>123456}}],
       "inline_css"=>nil,
       "merge"=>true,
       "X-MC-AutoText"=>true,
       "view_content_link"=>nil,
       "from_email"=>ENV["SITE_EMAIL"],
       "return_path_domain"=>nil,
       "metadata"=>{"website"=>"#{ENV["WEBSITE"]}"},
       "global_merge_vars"=>[{"content"=>"#{ENV["WEBSITE"]}", "name"=>"website_url"},{"content"=>"#{body}", "name"=>"body_data"},{"content"=>"#{member.email}", "name"=>"sender_email"},{"name"=>"fullname", "content"=>"#{member.name}"}],
       "headers"=>{"reply-to" => "#{member.email}"},
       "to"=>
          [{"type"=>"to",
              "name"=>"#{member.name}",
              "email"=>"#{member.email}"}],
       
       "signing_domain"=>nil}
      async = false
      ip_pool = "Main Pool"
      send_at = "2013-09-01 03:03:03 " # 2013-09-01 03:03:03 
      result = mandrill.messages.send_template template_name, template_content, member, async, ip_pool 
          # [{"reject_reason"=>"hard-bounce",
          #     "_id"=>"abc123abc123abc123abc123abc123",
          #     "email"=>"recipient.email@example.com",
          #     "status"=>"sent"}]

  rescue Mandrill::Error => e
      # Mandrill errors are thrown as exceptions
      puts "A mandrill error occurred: #{e.class} - #{e.member}"
      # A mandrill error occurred: Mandrill::UnknownSubaccountError - No subaccount exists with the id 'customer-123'    
      raise
  end


  
  
  
end
