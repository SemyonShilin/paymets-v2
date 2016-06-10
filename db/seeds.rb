# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

name = %w(Январь Февраль Март Апрель Май Июнь
          Июль Август Сентябрь Октябрь Ноябрь Декабрь)

Month.delete_all
Month.create!([{ name_month: name[0] },
             { name_month: name[1] },
             { name_month: name[2] },
             { name_month: name[3] },
             { name_month: name[4] },
             { name_month: name[5] },
             { name_month: name[6] },
             { name_month: name[7] },
             { name_month: name[8] },
             { name_month: name[9] },
             { name_month: name[10] },
             { name_month: name[11] }])
