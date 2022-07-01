namespace :example do
  desc "says hello to the world"
  task :sms_sender_daily => :environment do |_, args|
   User.find_each do |user|
      user.send_daily_sms if user.receive_texts == true
    end
  end

end