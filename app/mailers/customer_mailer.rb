class CustomerMailer < ActionMailer::Base
  CONTACT_BIKEDEED= '"BikeDeed" <info@bikedeed.io>'.freeze
  default from: CONTACT_BIKEDEED,
          content_type: 'multipart/alternative',
          parts_order: ['text/calendar', 'text/plain', 'text/html', 'text/enriched']
  layout 'email'

  def welcome_email(user)
    @user = user
    mail(to: @user.email)
  end

  def confirmation_email(user)
    @user = user
    mail(to: @user.email)
  end

  def password_reset_email(user)
    @user = user
    @url = "#{ENV['BASE_URL']}/users/password_reset?token=#{@user.password_reset_token}"
    mail(to: @user.email)
  end

  def additional_email_confirmation(user_email)
    @user_email = user_email
    @user = @user_email.user
    mail(to: @user_email.email)
  end

  def invoice_email(payment)
    @payment = payment
    mail(to: @payment.email)
  end

  def stolen_bike_alert_email(customer_contact)
    @customer_contact = customer_contact
    @info = customer_contact.info_hash
    @bike = customer_contact.bike
    @biketype = CycleType.find(@bike.cycle_type_id).name.downcase
    mail(to: @customer_contact.user_email, subject: @customer_contact.title)
  end

  def admin_contact_stolen_email(customer_contact)
    @customer_contact = customer_contact
    mail(to: @customer_contact.user_email, 'Reply-To' => @customer_contact.creator_email, subject: @customer_contact.title)
  end

  def stolen_notification_email(stolen_notification)
    @stolen_notification = stolen_notification
    mail(to: [@stolen_notification.receiver_email, 'lily@bikedeed.io', 'bryan@bikedeed.io'],
         from: 'bryan@bikedeed.io', subject: @stolen_notification.display_subject)
    dates = stolen_notification.send_dates_parsed + [Time.now.to_i]
    stolen_notification.update_attribute :send_dates, dates
  end

  def recovered_from_link(stolen_record)
    @stolen_record = stolen_record
    @bike = stolen_record.bike
    @biketype = CycleType.find(@bike.cycle_type_id).name.downcase
    mail(to: [@bike.owner_email],
         from: 'bryan@bikedeed.io',
         subject: "Your #{@biketype} has been marked recovered!")
  end

  def updated_terms_email(user)
    @user = user
    @_action_has_layout = false # layout is manually included here
    mail(to: @user.email,
         from: '"Lily Williams" <lily@bikedeed.io>',
         subject: 'BikeDeed Terms and Privacy Policy Update')
  end
end
