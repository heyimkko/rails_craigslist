class Post < ActiveRecord::Base
  EMAIL_REGEXP = /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/
  attr_accessible :category_id, :description, :email, :location, :name, :price
  before_validation :create_key, :on => :create
  belongs_to :category

  validates :name, :presence => true, :length => { :minimum => 3, :maximum => 100 }
  validates :description, :presence => true, :length => { :maximum => 10000 }
  validates :location, :presence => true
  validates :price, :presence => true, :numericality => true
  validates :email, :presence => true, :format => { :with => EMAIL_REGEXP }
  validates :key, :presence => true, :uniqueness => true

  private

  def random_key
    SecureRandom.hex(8)
  end

  def create_key
    key = random_key

    while Post.find_by_key(random_key) do
      key = random_key
    end
    
    self.key = key
  end
end
