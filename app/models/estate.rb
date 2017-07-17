class Estate < ActiveRecord::Base
  belongs_to :estate_type
  has_many :person_estates, dependent: :restrict_with_error
  has_many :persons, through: :person_estates

  validates :floor, numericality: { only_integer: true }, allow_nil: true
  validates :rooms, numericality: { only_integer: true }, allow_nil: true
  validates :regnum, numericality: { only_integer: true }, allow_blank: true
  validates :total_area, numericality: true, allow_nil: true
  validates :living_area, numericality: true, allow_nil: true

  def type
  	self.estate_type.name
  end

  def estate_title
  	"#{self.type} - #{self.name}"
  end
end
