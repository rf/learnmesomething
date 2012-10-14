namespace :bootstrap do
  desc "Add some test records"
  task :test_data => :environment do
    limits = Request.create(
      title: "What are limits?", 
      downvotes: 0,  
      description: "Please describe limits to me using small words and visual aids",
      upvotes: 1
    )

    fat = Request.create(
      title: "What is the difference between the fat arrow and regular arrow in CoffeeScript??", 
      downvotes: 0,  
      description: "I am confuse lol.",
      upvotes: 1
    )

    tofu = Request.create(
      title: "Should I eat this tofu based burrito?",
      downvotes: 0,  
      description: "I am confuse lol.",
      upvotes: 1
    )

    math = Tag.create name: "math"
    tofutag = Tag.create name: "tofu"

    a = RequestTag.create request_id: limits.id, tag_id: math.id
    b = RequestTag.create request_id: fat.id, tag_id: tofutag.id
    c = RequestTag.create request_id: tofu.id, tag_id: tofutag.id
  end

  desc "Run all bootstrapping stuffs"
  task all: [:test_data]
end
