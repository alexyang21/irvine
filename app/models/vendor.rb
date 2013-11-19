class Vendor < MailForm::Base
  attribute :restaurant,      :validate => true
  attribute :name,            :validate => true
  attribute :email,           :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone,           :validate => true

  def headers
    {
      :subject => "Vendor form submission",
      :to => "alexyang.personal@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end