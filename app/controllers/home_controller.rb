class HomeController < ApplicationController
  protect_from_forgery except: ['api_example_1']

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

  def bit_of_ajax
  end

  def api_example_1
    #expires_in 1.hour, public: false

    # let's pretend it's super expensive operation
    sleep 2.seconds

    render json: { result: params[:a].to_i + params[:b].to_i } if
      stale?(last_modified: Date.today, etag: [params[:a], params[:b]], template: false)
  end
end
