# == Schema Information
#
# Table name: view_records
#
#  id           :bigint(8)        not null, primary key
#  subject_type :string(255)
#  subject_id   :integer
#  create_time  :datetime
#  real_ip      :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ViewRecord < ApplicationRecord
  belongs_to :subject, polymorphic: true,counter_cache: true
end
