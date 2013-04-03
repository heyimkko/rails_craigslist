FactoryGirl.define do 
  factory :post do
    name "Fancy Feline"
    description "15 years old like new, for sale."
    location "San Francisco, CA"
    price 15
    category
    email "cool@kitty.com"
  end

  factory :category do
    name "Category"
  end
end
