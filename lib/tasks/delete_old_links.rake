desc "Delete links older than 1 month"

task :delete_old_links => :environment do
  puts "Deleting old links..."
  LinkDeleter.new.perform
  puts "Done."
end
