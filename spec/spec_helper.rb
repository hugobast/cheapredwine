require 'rspec/expectations'

RSpec::Matchers.define :have_features do |expected|
  match do |actual|
    actual.features == expected
  end
end

RSpec::Matchers.define :have_text do |expected|
  match do |actual|
    actual.text == expected
  end
end
