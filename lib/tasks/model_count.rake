namespace :model_count do

  desc "task that lists each model count"
  task :count do
    print "Users:"
    puts User.count
    print "Pins:"
    puts Pin.count
    print "Boards:"
    puts Board.count
  end

end
