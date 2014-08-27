class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates_presence_of :user, :post

  scope :created_after, lambda { |d| where("created_at>?",d)}

  def self.ransackable_scopes(auth=nil)
    [:created_after]
  end
end
