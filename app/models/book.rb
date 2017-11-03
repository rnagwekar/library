class Book < ApplicationRecord
  belongs_to :person, optional: true
end
