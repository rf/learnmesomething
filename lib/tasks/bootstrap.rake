namespace :bootstrap do
  desc "Add some test records"
  task :test_data => :environment do
    Request.create(
      title: "What are limits?", 
      downvotes: 0,  
      description: "Please describe limits to me using small words and visual aids",
      upvotes: 1
    )

    Request.create(
      title: "What is the difference between the fat arrow and regular arrow in CoffeeScript??", 
      downvotes: 0,  
      description: "I am confuse lol.",
      upvotes: 1
    )

    Request.create(
      title: "Should I eat this tofu based burrito?",
      downvotes: 0,  
      description: "I am confuse lol.",
      upvotes: 1
    )
  end

  desc "Run all bootstrapping stuffs"
  task all: [:test_data]
end
