Reaction.kinds #Hace referencia al metodo creado en el modelo

#07-07-2023

Product.find(2).categories #Traer las categorías de un producto

Category.find(3).products #Traer los productos de una categoría

Product.find(3).reactions

# Con las reacciones también funciona

Reaction.find(2).product

Reaction.find(2).user

#Todo lo que es posible en el rails console es posible en los controladores