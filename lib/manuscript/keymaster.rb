module Manuscript 
  class Keymaster
    
    def initialize(app)
      @app = app
    end

    def call(env)
      request = Rack::Request.new(env)
      session = env['rack.session']
      if env['PATH_INFO']=~/^\/admin/
        if (session[:sso] && session[:sso][:user_id]) && (session[:sso][:is_admin?]=='true' || session[:sso][:account_24_manager]=='24')
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