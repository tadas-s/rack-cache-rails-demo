class HomeController < ApplicationController
  def nocache
    expires_now
  end

  def public
    expires_in 5.minutes, public: true
  end

  def private
    expires_in 5.minutes, private: true
  end

  def shared_only
    expires_in 0.seconds, public: true, 's-maxage': 5.minutes
  end
end
