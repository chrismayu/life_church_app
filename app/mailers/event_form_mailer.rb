class EventFormMailer < ActionMailer::Base
   default from: ENV["SITE_EMAIL"]

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event_form.thank_you_we_have_received.subject
  #
  def thank_you_we_have_received(event, form, setup)
    @event = event
    @form = form
    @setup = setup

    mail to: setup.email_for_forms,  subject: "We have received your submission - Thank You"
    
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event_form.new_form_submitted.subject
  #
  def new_form_submitted(event, form, setup)
    @event = event
    @form = form
    @setup = setup
    
   mail to: form.email,  subject: "#{@form.first_name} #{ @form.last_name} just signed up for - #{@event.event_name}"
    
  end
end
