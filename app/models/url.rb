class Url < ApplicationRecord
  validates :short_hash, presence: true, uniqueness: true
  validates :url, presence: true

  def self.generate_code(length=5)
    symbols = [('a'..'z'), ('A'..'Z'), (1..9)].map(&:to_a).flatten
    (0...length).map { symbols[rand(symbols.length)] }.join
  end
end
