class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :posts

  validates :name, :presence => true
  validates :name, :length => { :minimum => 3 }
  validates :name, :length => { :maximum => 100 }
end
