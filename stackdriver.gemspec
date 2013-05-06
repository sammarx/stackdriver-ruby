Gem::Specification.new do |s|
  s.name = "stackdriver"
  s.version = "0.1.1"
  s.authors = ["Grant T. Olson"]
  s.email = ["kgo@grant-olson.net"]
  s.homepage = "https://github.com/grant-olson/stackdriver-ruby"
  s.summary = "Send StackDriver custom metrics"
  s.description = "Send StackDriver custom metrics via the API."
  s.license = "BSD 3 Clause"

  s.files = ["LICENSE", "./lib/stackdriver.rb"]

  s.add_dependency 'multi_json', '>= 1.7.0'
end