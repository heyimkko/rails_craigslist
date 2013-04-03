class Post < ActiveRecord::Base
  attr_accessible :category_id, :description, :email, :key, :location, :name, :price

  belongs_to :category

  validates :name, :presence => true
  validates :name, :length => { :minimum => 3 }
  validates :name, :length => { :maximum => 100 }

  validates :description, :presence => true
  validates :description, :length => { :maximum => 10000 }

  validates :location, :presence => true

  validates :price, :presence => true
  validates :price, :numericality => true

  validates :email, :presence => true
  validates :email, :format => { :with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/}
end