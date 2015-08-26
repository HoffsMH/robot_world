require 'simplecov'
SimpleCov.start

require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require 'fileutils'


$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/.."))


def sample_robots
[
  {
    name: "Matt",
    city: "Denver",
    state: "CO",
    birthdate: "07-04-1987",
    date_hired: "08-24-2015",
    department: "software"
  },

  {
    name: "Nick",
    city: "Lafayette",
    state: "LA",
    birthdate: "23-09-1987",
    date_hired: "08-24-2015",
    department: "finance"
  },

  {
    name: "Ben",
    city: "Lafayette",
    state: "LA",
    birthdate: "23-09-1967",
    date_hired: "08-24-2012",
    department: "software"
  }
]
end
