class Prototype < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  #with_options presence: true do~end 値が存在 (presence) しなければならないという制限を一括で設ける
  with_options presence: true do
    validates :title
    validates :catch_copy
    validates :concept
    validates :image
  end
end
