class Person < ActiveRecord::Base
  belongs_to :person_type
  has_many :person_estates, dependent: :restrict_with_error
  has_many :estates, through: :person_estates
  has_many :contacts

  validates :person_type, presence: true

  accepts_nested_attributes_for :estates, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :person_estates, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :contacts, allow_destroy: true, reject_if: :all_blank

  def fullname
    "#{lastname} #{firstname} #{middlename}"
  end

  alias_method :name, :fullname

end
