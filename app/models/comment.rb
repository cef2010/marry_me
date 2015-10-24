class Comment < ActiveRecord::Base
  def string_time
    self.created_at.strftime('%B %e, %Y')
  end
end
