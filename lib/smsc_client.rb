module SmscClient
  class Sms
    def initialize(login, password, charset = 'utf-8', sender = nil)
      @login = login
      @password = password
      @charset = charset
      @sender = sender
      @logger = Logger.new(Rails.root.join("log", "smsc.log"))
    end

    def send(phone, text)
      @logger.info "#{phone}: #{text}" #
      Timeout.timeout(10) do
        if ::Rails.env.development? # || Rails.env.staging?)
          puts "Отправляю sms с текстом #{text} на номер #{phone}"
          return
        end
        params = {
          login: @login,
          psw: @password,
          phones: phone,
          mes: text,
          charset: @charset
        }
        unless @sender.blank?
          params[:sender] = @sender
        end
        RestClient.post(
          'http://smsc.ru/sys/send.php', params
        )
      end
    rescue StandardError => e
      puts "Не удалось отправить sms: #{e.class.name}: #{e.message}" # РАЗОБРАТЬ
      puts e.backtrace.join("\n")
      Raven.capture_exception(e)
      raise e
    end
  end
end
