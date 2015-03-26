# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@sample = User.create( name: 'Sample User', email: 'yada@yadoo.com',  password_digest: BCrypt::Password.create("pwd", cost: 4), admin: true)

@sample.pins.create( title: 'Sample 1', description: 'yadayadyadaydaydayadya', user_id: '30', remote_pinimage_url: 'http://i.imgur.com/NJvCwj3.jpg')
@sample.pins.create( title: 'Sample 2', description: 'yadayadyadaydaydayadya', user_id: '30', remote_pinimage_url: 'http://s.petrolicious.com/2013/features/god-in-bmw-2002/1974-bmw-2002-03.jpg')
