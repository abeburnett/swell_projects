

puts 'creating gk'
u = User.create name: 'Gk', email: 'gk@gk.com', password: '1234'

r = Role.create name: 'super'
u.roles << r

puts 'creating abe'
u = User.create name: 'Abe', email: 'abe@abe.com', password: '1234'
