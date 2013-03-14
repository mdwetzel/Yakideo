class Mailer
  def initialize
    options = { :address      => "smtp.gmail.com",
                :port         => 587,
                :user_name    => Config::CREDENTIALS[:username],
                :password     => Config::CREDENTIALS[:password],
                :authentication => "plain",
                :enable_starttls_auto => true }

    Mail.defaults do
      delivery_method :smtp, options
    end
  end

  def send_mail(message)
    mail = Mail.new do
      from      'antieffort@gmail.com'
      to        'mark@markwetzel.com'
      subject   'Mail test'
      body      'Blah blah, this is a test.'
    end

    mail.deliver!
  end
end
