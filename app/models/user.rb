class User
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps
  
  attr_accessible :provider, :uid, :name, :email, :status, :remote_ip
  
  field :provider, :type => String
  field :uid, :type => String
  field :name, :type => String
  field :email, :type => String
  field :status, :type => Integer
  field :remote_ip, :type => String
  
  def self.create_with_omniauth(auth, remote_ip=nil)
    begin
      create! do |user|
        user.provider = auth['provider']
        user.uid = auth['uid']
        user.status = 0
        user.remote_ip = remote_ip if remote_ip
        if auth['user_info']
          user.name = auth['user_info']['name'] if auth['user_info']['name'] # Twitter, Google, Yahoo, GitHub
          user.email = auth['user_info']['email'] if auth['user_info']['email'] # Google, Yahoo, GitHub
        end
        if auth['extra']['user_hash']
          user.name = auth['extra']['user_hash']['name'] if auth['extra']['user_hash']['name'] # Facebook
          user.email = auth['extra']['user_hash']['email'] if auth['extra']['user_hash']['email'] # Facebook
        end
      end
    rescue Exception
      raise Exception, "cannot create user record"
    end
  end
  
end
