class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :merchants, through: :invoices

  validates :first_name, presence: true, uniqueness: {case_sensitive: false}
end
