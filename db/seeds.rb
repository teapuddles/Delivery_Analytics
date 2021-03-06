# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Device.destroy_all
Heartbeat.destroy_all
Report.destroy_all

d1 = Device.create(phone_number: "16317778989", carrier: "tmobile")
d2 = Device.create(phone_number: "15358884203", carrier: "verizon")
d3 = Device.create(phone_number: "(532)8380030", carrier: "sprint")

hb1 = Heartbeat.create(device_id: d2.id)
hb2 = Heartbeat.create(device_id: d3.id)

r1 = Report.create(sender: "yo", message: "momma", device_id: d1.id)
r2 = Report.create(sender: "ayy", message: "lmaoooo", device_id: d3.id)


puts "success!!"

