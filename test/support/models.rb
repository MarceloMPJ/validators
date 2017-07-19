class User < ActiveRecord::Base
  has_many :tasks
  has_many :categories
end

class Category < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
end

class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
end

class Buyer < ActiveRecord::Base
  self.table_name = :users
end

class Person < ActiveRecord::Base
  self.table_name = :users
end

class UserWithTLD
  include ActiveModel::Validations
  attr_accessor :url

  validates_url_format_of :url, tld: true

  def self.name
    'User'
  end

  def initialize(url)
    @url = url
  end
end

class ServerWithoutTLD
  include ActiveModel::Validations
  attr_accessor :host

  validates_hostname :host

  def initialize(host)
    @host = host
  end
end

class ServerWithTLD
  include ActiveModel::Validations
  attr_accessor :host

  validates_hostname :host, tld: true

  def initialize(host)
    @host = host
  end
end

class Site
  include ActiveModel::Validations
  attr_accessor :slug

  validates_subdomain :slug

  def initialize(slug)
    @slug = slug
  end
end
