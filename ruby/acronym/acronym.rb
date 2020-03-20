class Acronym
  def self.abbreviate(phrase)
    phrase.split(/[^a-zA-Z]{1,}/).map(&:chr).join.upcase
  end
end