class Borrower < ActiveRecord::Base
  has_secure_password
  has_many :transactions
  has_many :lenders, through: :transactions
  validates :first_name, :presence => true

  validates :last_name, presence: true

  # validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }

  validates :password, :presence => true, allow_nil: true

  validates :password, confirmation: true
end
