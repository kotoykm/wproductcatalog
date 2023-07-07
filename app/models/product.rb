class Product < ApplicationRecord
    has_and_belongs_to_many :categories
    has_many :reactions #Esto primero
    has_many :users, through: :reactions #Como base para declarar esto
    
    # Esto es transitivo
end
