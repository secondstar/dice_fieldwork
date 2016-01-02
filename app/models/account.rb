class Account < ActiveRecord::Base
  has_many :notes, as: :notable, :inverse_of => :notable
  has_many :addresses, as: :addressable, :inverse_of => :addressable
end
