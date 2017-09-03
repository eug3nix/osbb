class Contact < ActiveRecord::Base
  belongs_to :person
  belongs_to :contact_type

  validates :person, presence: true
  validates :contact_type, presence: true
end
