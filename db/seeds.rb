# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# ruby encoding: utf-8

Item.create(title: "Mojito", description: "Frita house mojito", price: "7.00")
Item.create(title: "Sangria", description: "Frita house sangria", price: "6.00")
Item.create(title: "Passion fruit soda", description: "Passion fruit soda made in-house", price: "3.00")
Item.create(title: "Tamarind soda", description: "Tamarind soda made in-house", price: "3.00")
Item.create(title: "Cafe con leche", description: "Fresh roasted beans", price: "3.00")
Item.create(title: "Cortadito", description: "Cuban espresso", price: "3.00")

Item.create(title: "Empanadas", description: "Sweet corn/chicken/beef picadillo", price: "8.00")
Item.create(title: "Frijoles negro", description: "Black bean soup", price: "5.00")
Item.create(title: "Chicharron de calamar", description: "Blue cornmeal crusted calamari, pico de gallo, sweet plantain", price: "10.00")
Item.create(title: "Congri", description: "Beans and rice with olives, raisins, and capers", price: "8.00")
Item.create(title: "Croquetas de queso", description: "Cheese croquettes", price: "8.00")
Item.create(title: "Aquacate caesar", description: "Romaine, avocado, cotija cheese, caesar dressing", price: "6.00")

Item.create(title: "Cubano", description: "Roast pork, ham, swiss cheese, salami, pickles, mustard", price: "12.00")
Item.create(title: "Gordito de la calle ocho", description: "Cuban sandwich with plantains", price: "14.00")
Item.create(title: "Pan con lechon", description: "Roasted pork, chicharron, pickled red onion", price: "14.00")
Item.create(title: "Torta de milanesa", description: "Breaded chicken cutlet, black beans, guacamole, chipotle mayo, rajas", price: "13.00")

Item.create(title: "Lomo saltado", description: "Stir fry of beef short ribs, red onions, tomato, potato, ginger", price: "18.00")
Item.create(title: "Ropa vieja", description: "Shredded pork dish with tomato salsa, garbanzo beans, and potatoes", price: "17.00")
Item.create(title: "Churrasco", description: "Grilled skirt steak, moros, sweet plantain, chimichurri sauce", price: "20.00")
Item.create(title: "Pernil", description: "Roasted pork, yucca, mojo, chicharron", price: "17.00")
Item.create(title: "Filet of sole", description: "A la plancha, quinoa, caper lemon chile de arbol butter", price: "16.00")

Item.create(title: "Pastelitos", description: "Cuban pastries: guava, cheese, and coconut", price: "3.00")
Item.create(title: "Panatela Cubana", description: "Cuban cake rolls", price: "3.00")
Item.create(title: "Pudin de pan", description: "Bread pudding", price: "5.00")
Item.create(title: "Tres leche", description: "Milk cake", price: "5.00")

Category.create(title: "Drinks", description: "Cocktails, juices, and coffees")
Category.create(title: "Small Plates", description: "Small tastes to whet your appetite")
Category.create(title: "Sandwiches", description: "More than your average Cubano")
Category.create(title: "Entrées", description: "Rich and hearty")
Category.create(title: "Desserts", description: "A sweet treat to end the meal")

ItemCategory.create(item_id: 1, category_id: 1)
ItemCategory.create(item_id: 2, category_id: 1)
ItemCategory.create(item_id: 3, category_id: 1)
ItemCategory.create(item_id: 4, category_id: 1)
ItemCategory.create(item_id: 5, category_id: 1)
ItemCategory.create(item_id: 6, category_id: 1)
ItemCategory.create(item_id: 7, category_id: 2)
ItemCategory.create(item_id: 8, category_id: 2)
ItemCategory.create(item_id: 9, category_id: 2)
ItemCategory.create(item_id: 10, category_id: 2)
ItemCategory.create(item_id: 11, category_id: 2)
ItemCategory.create(item_id: 12, category_id: 2)
ItemCategory.create(item_id: 13, category_id: 3)
ItemCategory.create(item_id: 14, category_id: 3)
ItemCategory.create(item_id: 15, category_id: 3)
ItemCategory.create(item_id: 16, category_id: 3)
ItemCategory.create(item_id: 17, category_id: 4)
ItemCategory.create(item_id: 18, category_id: 4)
ItemCategory.create(item_id: 19, category_id: 4)
ItemCategory.create(item_id: 20, category_id: 4)
ItemCategory.create(item_id: 21, category_id: 4)
ItemCategory.create(item_id: 22, category_id: 5)
ItemCategory.create(item_id: 23, category_id: 5)
ItemCategory.create(item_id: 24, category_id: 5)
ItemCategory.create(item_id: 25, category_id: 5)
