# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..50).to_a.each {|u| User.create(name: "user#{u}")}
(1..10).to_a.each {|u| Group.create(name: "group#{u}")}

10.times.map{ Random.rand(50) }.each do |n|
  _random = rand(50)
  next if _random == n
  User.where(id: _random).first.add_friend(n)
  User.where(id: _random).first.add_followee(n)
  User.where(id: _random).first.add_following(n)
end

10.times.map{ Random.rand(10) }.each do |n|
  _random = rand(50)
  next if _random == n
  Group.where(id: _random).first.add_admin(n)
  Group.where(id: _random).first.add_member(n)
end