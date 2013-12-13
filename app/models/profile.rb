class Profile < ActiveRecord::Base
  attr_accessible :hometown, :birth_day, :birth_month, :birth_year
  attr_accessible :work, :education, :interests, :quote

  belongs_to :user



  def birthdate
    if self.birth_day and self.birth_month and self.birth_year
      self.birth_month.to_s + "/" + self.birth_day.to_s + "/" + self.birth_year.to_s
    end
  end


end
