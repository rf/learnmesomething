namespace :bootstrap do
  desc "Add some test records"
  task :test_data => :environment do
    limits = Request.create(
      title: "What are limits?", 
      downvotes: 0,  
      description: "Please describe limits to me using small words and visual aids",
      upvotes: 1
    )
    limits.user = User.first
    limits.save!

    puts limits.inspect

    fat = Request.create(
      title: "What is the difference between the fat arrow and regular arrow in CoffeeScript??", 
      downvotes: 0,  
      description: "I am confuse lol.",
      upvotes: 1
    )
    fat.user = User.first
    fat.save!

    puts fat.inspect

    tofu = Request.create(
      title: "Should I eat this tofu based burrito?",
      downvotes: 0,  
      description: "I am confuse lol.",
      upvotes: 0
    )
    tofu.user = User.first
    tofu.save!

    puts tofu.inspect

    math = Tag.create name: "math"
    tofutag = Tag.create name: "tofu"

    puts math

    a = RequestTag.create request_id: limits.id, tag_id: math.id
    b = RequestTag.create request_id: fat.id, tag_id: tofutag.id
    c = RequestTag.create request_id: tofu.id, tag_id: tofutag.id

    puts a
  end

  desc "Run all bootstrapping stuffs"
  task all: [:test_data]
end
