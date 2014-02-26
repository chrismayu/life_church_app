class StaffMailer < ActionMailer::Base
  default from: ENV["SITE_EMAIL"]
  
  require 'mandrill'

    def staff_message(message)
        @message = message
    
       # mail to: message.staff_email, :reply_to => message.email, subject: "Message from #{message.name}  - #{message.subject} "

        mandrill = Mandrill::API.new ENV["MANDRILL_API_KEY"]
        template_name = "Staff_Contact"
        template_content = [{"name"=>"fullname", "content"=>"#{message.name}"}, {"name"=>"staffname", "content"=>"#{message.staff_name}"}]
        message = {"google_analytics_campaign"=>"message.from_email@example.com",
         "url_strip_qs"=>nil,
         "from_name"=>"LifeChurch",
         "subject"=>"#{message.subject}",
         "recipient_metadata"=>
            [{"rcpt"=>"#{message.staff_email}", "values"=>{"user_id"=>123456}}],
         "inline_css"=>nil,
         "merge"=>true,
         "view_content_link"=>nil,
         "from_email"=>ENV["SITE_EMAIL"],
         "return_path_domain"=>nil,
         "metadata"=>{"website"=>"www.life-church.herokuapp.com"},
         "global_merge_vars"=>[{"content"=>"#{message.body}", "name"=>"body_data"},{"content"=>"#{message.email}", "name"=>"sender_email"},{"name"=>"fullname", "content"=>"#{message.name}"}, {"name"=>"staffname", "content"=>"#{message.staff_name}"}],
         "headers"=>{"Reply-To"=>"#{message.email}"},
         "to"=>
            [{"type"=>"to",
                "name"=>"#{message.staff_name}",
                "email"=>"#{message.staff_email}"}],
         
         "signing_domain"=>nil}
        async = false
        ip_pool = "Main Pool"
        send_at = "2013-09-01 03:03:03 " # 2013-09-01 03:03:03 
        result = mandrill.messages.send_template template_name, template_content, message, async, ip_pool 
            # [{"reject_reason"=>"hard-bounce",
            #     "_id"=>"abc123abc123abc123abc123abc123",
            #     "email"=>"recipient.email@example.com",
            #     "status"=>"sent"}]

    rescue Mandrill::Error => e
        # Mandrill errors are thrown as exceptions
        puts "A mandrill error occurred: #{e.class} - #{e.message}"
        # A mandrill error occurred: Mandrill::UnknownSubaccountError - No subaccount exists with the id 'customer-123'    
        raise
    end


 
  
  
  
end



