Gem::Specification.new do |s|
  s.name = "stackdriver"
  s.version = "0.3.0"
  s.authors = ["Grant T. Olson",'Sam Marx']
  s.email = ["smarx@spredfast.com"]
  s.homepage = "https://github.com/sammarx/stackdriver-ruby"
  s.summary = "Stackdriver API and custom metrics"
  s.description = "Gem for Stackdriver API and custom metrics."
  s.license = "BSD 3 Clause"

  s.files = ["LICENSE", "./lib/stackdriver.rb"]

  s.add_dependency 'multi_json', '>= 1.7.0'
end
