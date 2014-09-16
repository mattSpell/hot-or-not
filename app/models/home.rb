class Home < ActiveRecord::Base
  has_many :viewed_homes
  has_many :users, through: :viewed_homes
  default_scope ->{ order("homes.created_at DESC") }

  def self.get_unseen_homes(user)
    includes(:viewed_homes).references(:viewed_homes).
      where.not(viewed_homes: { user_id: user.id })
  end

end
