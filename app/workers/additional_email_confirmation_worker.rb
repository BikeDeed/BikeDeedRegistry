class AdditionalEmailConfirmationWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'notify'
  sidekiq_options backtrace: true

  def perform(user_email_id)
    user_email = UserEmail.find(user_email_id)
    logger.debug("foobar")
    CustomerMailer.additional_email_confirmation(user_email).deliver_now
  end
end
