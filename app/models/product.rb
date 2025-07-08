class Product < ApplicationRecord
  has_many_attached :images do |attachable|
        attachable.variant :thumb, resize: '50, 50'
        attachable.variant :large, resize: '250, 250'
    end

  belongs_to :category
  has_many :stocks
end
