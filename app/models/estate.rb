class Estate < ActiveRecord::Base
  belongs_to :estate_type
  has_many :person_estates
  has_many :persons, through: :person_estates
end
