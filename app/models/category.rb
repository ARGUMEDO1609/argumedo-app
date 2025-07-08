class Category < ApplicationRecord
    has_one_attached :image do |attachable|
        attachable.variant :thumb, resize: '100x100'
    end
    has_many :products, dependent: :destroy
end
