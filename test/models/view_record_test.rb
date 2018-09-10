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

require 'test_helper'

class ViewRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
