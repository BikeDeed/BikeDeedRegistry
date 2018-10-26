class AdminMailer < ActionMailer::Base
  default from: 'contact@bikedeed.io', content_type: 'multipart/alternative', parts_order: ['text/calendar', 'text/plain', 'text/html', 'text/enriched']
  default to: 'contact@bikedeed.io'
  layout 'email'

  def feedback_notification_email(feedback)
    @feedback = feedback
    send_to = 'contact@bikedeed.io'
    if @feedback.feedback_type.present?
      send_to += ', bryan@bikedeed.io, lily@bikedeed.io' if @feedback.feedback_type =~ /bike_recovery/
      send_to = 'bryan@bikedeed.io' if @feedback.feedback_type =~ /stolen_information/
    end
    mail('Reply-To' => feedback.email, to: send_to, subject: feedback.title)
  end

  def no_admins_notification_email(organization)
    @organization = organization
    mail(to: 'contact@bikedeed.io', subject: "#{@organization.name} doesn't have any admins!")
  end

  def blocked_stolen_notification_email(stolen_notification)
    @stolen_notification = stolen_notification
    mail(to: 'bryan@bikedeed.io', bcc: 'contact@bikedeed.io', subject: 'Stolen notification blocked!')
  end

  def lightspeed_notification_email(organization, api_key)
    @organization = organization
    @api_key = api_key
    mail(to: 'admin@bikedeed.io', subject: 'Api Notification sent!')
  end
end
