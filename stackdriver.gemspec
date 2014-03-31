Gem::Specification.new do |s|
  s.name = "stackdriver"
  s.version = "0.2.1"
  s.authors = ["Grant T. Olson", "Sam Marx"]
  s.email = ["smarx@spredfast.com"]
  s.homepage = "https://github.com/sammarx/stackdriver-ruby"
  s.summary = "StackDriver custom metrics gem"
  s.description = "Send and delete StackDriver custom metrics via the API."
  s.license = "BSD 3 Clause"

  s.files = ["LICENSE", "./lib/stackdriver.rb"]

  s.add_dependency 'multi_json', '>= 1.7.0'
end