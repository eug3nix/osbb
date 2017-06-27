class Person < ActiveRecord::Base
  belongs_to :person_type
  has_many :person_estates
  has_many :estates, through: :person_estates

  accepts_nested_attributes_for :person_estates, allow_destroy: true
  def name
    "#{lastname} #{firstname}"
  end

end
