namespace :sales do
  desc 'Update sales'
  task :update => :environment do
    puts "Updating Sales Data"
    SalesMatview.refresh
  end
end
