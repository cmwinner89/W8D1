# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :text             not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Sub < ApplicationRecord

    validates :title, presence: true, uniqueness: true
    validates :description, presence: true

    belongs_to :moderator,
        primary_key: :id,
        foreign_key: :moderator_id,
        class_name: :User

    has_many :post_subs,
        primary_key: :id,
        foreign_key: :sub_id,
        class_name: :PostSub,
        inverse_of: :sub

    has_many :posts,
       through: :post_subs,
       source: :post
    
end
 