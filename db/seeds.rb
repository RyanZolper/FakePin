# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create( name: 'Sample User', email: 'yadayada@yadoo.com',  password_digest: 'password', admin: true)

Pin.create( title: 'Sample 1', description: 'yadayadyadaydaydayadya', user_id: '30', remote_pinimage_url: 'http://i.imgur.com/NJvCwj3.jpg')
