class Shop < ApplicationRecord
	def self.search(search)
      if search
        Shop.where(['address LIKE ?', "%#{search}%"])#titleの部分に検索したい部分一致のカラムを入れる
      else
        Shop.all
      end
  end

	belongs_to :user
	attachment :shop_image
  has_many :post_comments, dependent: :destroy

end
