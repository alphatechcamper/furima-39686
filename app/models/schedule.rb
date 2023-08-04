class Schedule < ActiveHash::Base
  self.data = [
    { id: 1, schedule: '---' },
    { id: 2, schedule: '1~2日で発送' },
    { id: 3, schedule: '2~3日で発送' },
    { id: 4, schedule: '4~7日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
end
