class Estate < ActiveRecord::Base
  belongs_to :estate_type
  has_many :person_estates, dependent: :restrict_with_error
  has_many :persons, through: :person_estates
end
