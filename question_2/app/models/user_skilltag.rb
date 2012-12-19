# coding: utf-8
class UserSkilltag < ActiveRecord::Base
  attr_accessible :skilltag_id, :user_id

  belongs_to :user
  belongs_to :skilltag

  validates_uniqueness_of :skilltag_id, scope: :user_id, message: 'は、すでに登録済みです'
end
