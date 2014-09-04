class Student < ActiveRecord::Base
  validates_presence_of :name

  scope :pickable, ->{
    where("last_called is null OR last_called < ?", 5.minutes.ago)
  }
  scope :nothing, ->(value){
    where("1 = ?", value)
  }
end
