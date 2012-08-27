module SendGrid
  class MailInterceptor
    def self.delivering_email(mail_message)
      sendgrid_header  = mail_message.instance_variable_get(:@sendgrid_header)
      smtp_credentials = mail_message.instance_variable_get(:@smtp_credentials) 
      # incorporate per-message SMTP over-ride for use with sub-accounts
      mail_message.delivery_method.settings.merge!(smtp_credentials) if smtp_credentials.instance_of?(Hash)
      # since we're using headers, we need to explicitly set the recipient header
      sendgrid_header.add_recipients(mail_message.to)
      mail_message.header['X-SMTPAPI'] = sendgrid_header.to_json if sendgrid_header.data.present?
      # Let's keep our emails valid, shall we?
      # mail_message.header['to'] = 'dummy@email.com'
      
      # mail_message.perform_deliveries = false unless Rails.env.production?
    end
  end
end