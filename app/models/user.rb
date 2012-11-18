# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  first_name   :string(255)
#  last_name    :string(255)
#  photo        :string(255)
#  access_token :string(255)
#  facebook_id  :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  likes        :text
#  movies       :text
#  music        :text
#  books        :text
#  locations    :text
#

class User < ActiveRecord::Base
  # attr_accessible :title, :body
end
