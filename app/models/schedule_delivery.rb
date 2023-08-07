class ScheduleDelivery < ActiveHash::Base
  self.data = [
    { id: 1, schedule_delivery: '---' },
    { id: 2, schedule_delivery: '1~2日で発送' },
    { id: 3, schedule_delivery: '2~3日で発送' },
    { id: 4, schedule_delivery: '4~7日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
end
