class TelegrammailerMailer < ApplicationMailer
  
  def group_message(text)
    api_key = ENV['TELEGRAM_BOT_ID']
    chat_id = ENV['TELEGRAM_GROUP_BOT_CHAT_ID']
    #text="video"
    HTTParty.post("https://api.telegram.org/bot#{api_key}/sendMessage",
      headers: {
        'Content-Type' => 'application/json'
      },
      body: {
        chat_id: chat_id,
        text: text

      }.to_json
    )
    
  end

  def send_mesg 
    text = params[:content]
    TelegrammailerMailer.group_message(text).deliver_now
    redirect_to root_path, notice: "success"
  end

  def private_msg(text)

    api_key_private = ENV['TELEGRAM_BOT_ID_PRIVATE']
    chat_id_private = ENV['TELEGRAM_GROUP_BOT_CHAT_ID_PRIVATE']
    HTTParty.post("https://api.telegram.org/bot#{api_key_private}/sendMessage",
      headers: {
        'Content-Type' => 'application/json'
      },
      body: {
        chat_id: chat_id_private,
        text: text

      }.to_json
    )
  end

  def send_private_message
    text = params[:content]
    TelegrammailerMailer.private_msg(text).deliver_now
    redirect_to root_path, notice: "success"

  end

end
