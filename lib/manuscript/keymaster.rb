module Manuscript 
  class Keymaster
    
    def initialize(app, options={})
      @app = app
    end

    def call(env)
      request = Rack::Request.new(env)
      session = env['rack.session']
      if env['PATH_INFO']=~/^\/admin/
        if (session[:sso] && session[:sso][:user_id])
          @app.call(env)
        else
          [302, {"Location" => "/sso/login?return_to=#{request.url}"}, "Redirecting to SSO server..."]
        end
      else
        @app.call(env)
      end
    end
  end
end