class Course < ApplicationRecord
  belongs_to :user
  has_many :exercises, dependent: :destroy
  has_rich_text :content

  # message: "verifier que votre nom numéro est 10 chiffres"}
  validates :title, length: {minimum:10, maximum:150, message:"Verifiez que le titre n'est pas trop long. la longueur du titre est limité 150 caracteres"}
  validates :title, :content, :user_id, :slug, presence: true

  #Slugged concern
  include ItemsSlugged
  
end
