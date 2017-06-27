class PersonEstate < ActiveRecord::Base
  belongs_to :person
  belongs_to :estate
  belongs_to :person_estate_status
end
