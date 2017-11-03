class Device < ApplicationRecord
  belongs_to :person

  CATEGORY = ["Phone", "Tab"]
  LOCATION = ["ALL", "Hyderabad", "Irvine", "Nizhny"] 

end
