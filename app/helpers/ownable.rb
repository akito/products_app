module Ownable
  def owned_by?(user)
    user_id == user.id
  end
end
