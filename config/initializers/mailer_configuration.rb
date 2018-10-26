unless Rails.env.test?
  ActionMailer::Base.smtp_settings = {
    port:           '25',
    address:        'localhost'
    #port:           '465',
    #address:        'smtp.mail.us-east-1.awsapps.com',
    #user_name:      'info',
    #password:       'U2=Z6aaAj%JTCE',
    #authentication: :plain
    #port:           ENV['SPARKPOST_PORT'],
    #address:        'smtp.sparkpostmail.com',
    #user_name:      ENV['SPARKPOST_USERNAME'],
    #password:       ENV['SPARKPOST_PASSWORD'],
    #authentication: :plain
  }
end
