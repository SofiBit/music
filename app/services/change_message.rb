# frozen_string_literal: true

class ChangeMessage
  LINK_FORMAT = /(https?:\/\/)?([\w-]{1,32}\.[\w-]{1,32})[^\s@]*/

  class << self
    def run(message:)
      new(message: message).run
    end
  end

  def initialize(message)
    @message = message[:message]
  end

  def run
    words = @message.split
    words.map! do |word|
      word.gsub!(LINK_FORMAT, "<a href='#{word[LINK_FORMAT]}' target='_blank'>#{word[LINK_FORMAT]}</a>") unless word !~ LINK_FORMAT
      word += ''
    end
    words.join(' ')
  end
end
