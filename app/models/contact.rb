class Contact < ActiveRecord::Base
  belongs_to :person
  belongs_to :type
end
