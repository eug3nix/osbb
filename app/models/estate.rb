class Estate < ActiveRecord::Base
  belongs_to :estate_type, required: true
  has_many :person_estates, dependent: :restrict_with_error
  has_many :persons, through: :person_estates
  has_many :payments
  has_many :cars

  validates :estate_type, presence: true

  validates :floor, numericality: { only_integer: true }, allow_nil: true
  validates :rooms, numericality: { only_integer: true }, allow_nil: true
  validates :regnum, numericality: { only_integer: true }, allow_blank: true
  validates :section, inclusion: 1..2, allow_blank: true
  validates :total_area, numericality: true, allow_nil: true
  validates :living_area, numericality: true, allow_nil: true

  def type
  	self.estate_type.name
  end

  def estate_title
  	"#{self.type} - #{self.name}"
  end
end
