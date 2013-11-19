class Driver < MailForm::Base
  attribute :first_name,      :validate => true
  attribute :last_name,       :validate => true
  attribute :email,           :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone,           :validate => true
  attribute :old_enough,      :validate => true
  attribute :car_year,        :validate => true
  attribute :car_make,        :validate => true
  attribute :car_model,       :validate => true
  attribute :conviction,      :validate => true
  attribute :experience,   :validate => true
  attribute :violations,        :validate => true
  attribute :hours,           :validate => true


  def headers
    {
      :subject => "Driver form submission",
      :to => "alexyang.personal@gmail.com",
      :from => %("#{first_name} #{last_name}" <#{email}>)
    }
  end
end