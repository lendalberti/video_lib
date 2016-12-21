# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

videos = Video.create [
  { name: 'Ruby Variables' },
  { name: 'Ruby Operators' },
  { name: 'Ruby Methods'   },
  { name: 'Ruby Classes'   },
]

badges = Badge.create [
  { name: 'Half-Way', fa_symbol: 'bookmark-o' },
  { name: 'All-Way',  fa_symbol: 'bookmark'   },
  { name: 'SpeedRun', fa_symbol: 'bolt'       },
  { name: 'Cube3',    fa_symbol: 'cubes'      },
]

companies = Company.create [
  { name: 'Vodeclic'   },
  { name: 'Thoughtbot' },
  { name: 'Basecamp'   },
  { name: 'IBM'        },
  { name: 'Honeywell'  },
]

users = User.create [
  { name: 'Tom',  company: companies.first   },
  { name: 'Bill', company: companies.first   },
  { name: 'Dave', company: companies.second  },
  { name: 'Joe',  company: companies.third   },
  { name: 'Len',  company: companies.fourth  },
]

rules = Rule.create [
  { name: 'Half',  badge_name: 'Half-Way', video_name: '*',            view_count: 2 },
  { name: 'Full',  badge_name: 'All-Way',  video_name: '*',            view_count: 0 },
  { name: 'Speed', badge_name: 'SpeedRun', video_name: 'Ruby Classes', view_count: 1 },
  { name: 'Cubes', badge_name: 'Cube3',    video_name: 'Ruby Methods', view_count: 3 },
]
