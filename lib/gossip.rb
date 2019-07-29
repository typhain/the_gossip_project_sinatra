require 'pry'
require 'csv'

class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
  CSV.open("./db/gossip.csv", "ab") do |csv|
    csv << [@author, @content]
    end
  end

end
