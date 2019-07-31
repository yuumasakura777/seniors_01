class Residence < ApplicationRecord
  has_many :users

  #IDが一致
  scope :id_is, -> id{
    where(id: id)
  }
end
