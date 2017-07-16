class PersonEstate < ActiveRecord::Base
  belongs_to :person
  belongs_to :estate
  belongs_to :person_estate_status

  accepts_nested_attributes_for :person, allow_destroy: true, reject_if: :all_blank

  def name
    "#{self.try(:person).name} <-> #{self.try(:estate).name}"
  end
end
