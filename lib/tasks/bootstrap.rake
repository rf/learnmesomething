namespace :bootstrap do
  desc "Add some test records"
  task :test_data => :environment do
    limits = Request.create(
      title: "What are limits?", 
      downvotes: 0,  
      description: "Please describe limits to me using small words and visual aids",
      upvotes: 1,
      user_id: 2
    )

    puts limits.inspect

    fat = Request.create(
      title: "What is the difference between the fat arrow and regular arrow in CoffeeScript??", 
      downvotes: 0,  
      description: "I am confuse lol.",
      upvotes: 1,
      user_id: 2
    )

    puts fat.inspect

    tofu = Request.create(
      title: "Should I eat this tofu based burrito?",
      downvotes: 0,  
      description: "I am confuse lol.",
      upvotes: 0,
      user_id: 2
    )

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
