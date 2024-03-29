# == Schema Information
#
# Table name: article_tags
#
#  id         :bigint(8)        not null, primary key
#  article_id :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArticleTag < ApplicationRecord
  belongs_to :article
  belongs_to :tag
end
