namespace :texts do
  desc 'send daily sms to user'
  task :sms_sender_daily => :environment do |_, args|
    User.find_each do |user|
      user.send_daily_sms if user.receive_texts == true
    end
  end
end 