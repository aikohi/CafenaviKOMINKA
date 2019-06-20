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
  has_many :favorites, foreign_key: 'shop_id', dependent: :destroy #お気に入り
  has_many :users, through: :favorites #お気に入り

  with_options presence: true do
    validates :shop_name
    validates :introduction
    validates :first_menu
    validates :first_price
    validates :second_menu
    validates :second_price
    validates :start_time
    validates :last_time
    validates :holiday
    validates :address
    validates :phone_number
  end

end
