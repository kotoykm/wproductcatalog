class Category < ApplicationRecord
    has_and_belongs_to_many :products #Tiene muchas pero al mismo tiempo pertenece a ellas
    validates :name, uniqueness: true #Valida que existan nombres de categorias unicos
end
