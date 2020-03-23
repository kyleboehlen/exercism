class Acronym
  def self.abbreviate(phrase)
    phrase.scan(/[^a-zA-Z]{0,1}([a-zA-Z]{1})[a-zA-Z]{0,}/).join.upcase
  end
end