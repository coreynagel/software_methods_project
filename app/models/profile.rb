class Profile < ActiveRecord::Base
  attr_accessible :hometown, :birth_day, :birth_month, :birth_year
  attr_accessible :work, :education, :interests, :quote

  belongs_to :user

  before_save :default_values
  before_save { self.hometown.downcase! }
  before_save { self.hometown.capitalize! }
  before_save { self.quote.gsub!('"', '')}
  before_save { self.quote = '"' + self.quote + '"'}
  before_save { self.education.gsub!(/\b('?[a-z])/) { $1.capitalize } }
  before_save { self.work.gsub!(/\b('?[a-z])/) { $1.capitalize } }

  #VALID_DAY_REGEX = /(0[1-9]|1[012])/
  #VALID_MONTH_REGEX = /(0[1-9]|[12][0-9]|3[01])/
  #VALID_YEAR_REGEX = /(19|20)\d\d/
  #validates :birth_day, format: { with: VALID_DAY_REGEX }
  #validates :birth_month, format: { with: VALID_MONTH_REGEX }
  #validates :birth_year, format: { with: VALID_YEAR_REGEX }


  def birthdate
    if self.birth_day and self.birth_month and self.birth_year
      self.birth_month.to_s + "/" + self.birth_day.to_s + "/" + self.birth_year.to_s
    end
  end


  def default_values
    self.hometown ||= ''
    self.work ||= ''
    self.education ||= ''
    self.interests ||= ''
    self.birth_day ||= ''
    self.birth_month ||= ''
    self.birth_year ||= ''
    self.quote ||= ''
  end

  def filled_out
    !self.hometown.empty? or !self.work.empty? or !self.education.empty? or !self.birthdate.nil? or !self.interests.empty? or (self.quote.length > 2)
  end
end

