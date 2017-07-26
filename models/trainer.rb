class Trainer < ActiveRecord::Base
  has_many :pokemons, dependent: :destroy
  belongs_to :team
end
