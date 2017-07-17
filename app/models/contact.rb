class Contact < ActiveRecord::Base
  belongs_to :person
  belongs_to :contact_type

end
