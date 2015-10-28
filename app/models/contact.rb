class Contact < ActiveRecord::Base

  def self.print
    self.all.each do |contact|
      puts "------ CONTACT ID:#{contact.id} ------"
      puts "FROM: #{contact.name}"
      puts "EMAIL: #{contact.email}"
      puts "BODY: #{contact.body}"
    end
  end
end
