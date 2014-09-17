class Home < ActiveRecord::Base
  has_many :viewed_homes
  has_many :users, through: :viewed_homes
  default_scope ->{ order("homes.created_at DESC") }

  def self.update_home(user, fav, home_id)
    home = Home.where(:id => home_id).first
    thing = ViewedHome.create(home_id: home.id, user_id: user.id, favorite: fav)
    next_home = get_next_home(user)
    return next_home
  end

  def self.get_next_home(user)
    home = get_unseen_homes(user).first
    return home
  end

  def self.get_unseen_homes(user)
    Home.joins("LEFT OUTER JOIN (SELECT * FROM viewed_homes WHERE user_id = #{user.
      id}) AS viewed_homes ON homes.id = viewed_homes.home_id").
      where("viewed_homes.id IS NULL").to_a
  end

end
