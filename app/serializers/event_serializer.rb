class EventSerializer
  include FastJsonapi::ObjectSerializer
  # attributes
  attributes :name, :description, :startdate, :user_id, :user
  # belongs_to :user
end
