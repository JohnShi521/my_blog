# == Schema Information
#
# Table name: articles
#
#  id                :bigint(8)        not null, primary key
#  type              :string(255)
#  title             :string(255)
#  content           :text(4294967295)
#  view_record_count :integer          default(0)
#  create_time       :datetime
#  user_id           :integer
#  category_id       :integer
#  status            :integer          default("created")
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  source_type       :integer
#

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
