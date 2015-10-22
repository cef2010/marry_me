class Comment < ActiveRecord::Base

  # in order to add the time it was created we'll need adjust the created_at from UTC to users timezone
  def string_time
    self.created_at.strftime('%B %e, %Y')
  end
end
