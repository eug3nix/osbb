class Estate < ActiveRecord::Base
  belongs_to :estate_type
  has_many :person_estates, dependent: :restrict_with_error
  has_many :persons, through: :person_estates

  def type
  	self.estate_type.name
  end

  def estate_title
  	"#{self.type} - #{self.name}"
  end
end
