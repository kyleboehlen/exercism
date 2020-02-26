class TwoFer
  TWO_FER =
    {
      English: 'One for %<name>s, one for me.'
    }
    
  def self.two_fer(name = 'you', language = :English)
    TWO_FER[language] % { name: name }
  end
end