# == Schema Information
#
# Table name: articles
#
#  id                 :bigint(8)        not null, primary key
#  type               :string(255)
#  title              :string(255)
#  content            :text(4294967295)
#  view_records_count :integer          default(0)
#  create_time        :datetime
#  user_id            :integer
#  category_id        :integer
#  status             :integer          default("created")
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  source_type        :integer
#  short_content      :string(255)
#

class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :article_tags
  has_many :tags, through: :article_tags
  has_many :view_records,as: :subject

  scope :is_show_home, -> {where(status:1)}

  Types = {
        "Articles::Technical" => '技术分享',
      "Articles::Life" => '生活杂谈'
  }


  SourceTypes = {
      "original" => '原创',
      "reprint" => '转载'
  }

  enum source_type:{
      original: 1,
      reprint: 2
  }

  enum status:{
      created: 0,
      verify: 1,
      hide: 2
  }

end
