class Student < ActiveRecord::Base
  validates_presence_of :name

  default_scope lambda() { order("last_called ASC NULLS FIRST") }
  scope :pickable, ->{
    where("last_called is null OR last_called < ?", 5.minutes.ago)
  }
  scope :nothing, ->(value){
    where("1 = ?", value)
  }
end
