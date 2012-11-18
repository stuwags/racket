# == Schema Information
#
# Table name: serves
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  comment      :text
#  from_user_id :integer
#  to_user_id   :integer
#  hit          :boolean
#  miss         :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Serve < ActiveRecord::Base
  attr_accessible :name, :comment, :from_user_id, :to_user_id, :to_facebook_ids
end
