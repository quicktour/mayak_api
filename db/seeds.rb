# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ids_array = [
              { imt_id: 19400835, product_name: "Колготки" },
              { imt_id: 19400834, product_name: "Фитнес-браслет Mi Band 6" },
              { imt_id: 19400824, product_name: "Блузка" },
              { imt_id: 19400827, product_name: "Пижама" },
              { imt_id: 19400820, product_name: "Нож туристический" },
              { imt_id: 19400822, product_name: "Чалма" },
              { imt_id: 19400811, product_name: "Сиденье для ванной" },
              { imt_id: 19400812, product_name: "Папка планшет для документов А4 с зажимом магнитом" },
              { imt_id: 19400814, product_name: "Подарочный набор с перьевой ручкой" },
              { imt_id: 19400815, product_name: "машинка" },
              { imt_id: 19400817, product_name: "Нож туристический" }
            ]

ids_array.each do |item|
  Card.create(item)
end