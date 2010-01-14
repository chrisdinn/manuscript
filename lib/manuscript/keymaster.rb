module Manuscript 
  class Keymaster
    
    def initialize(app, options={})
      @app = app
      @hotink_account_id = options[:hotink_account_id] || 1
    end

    def call(env)
      request = Rack::Request.new(env)
      session = env['rack.session']
      if env['PATH_INFO']=~/^\/admin/
        if (session[:sso] && session[:sso][:user_id]) && (session[:sso][:is_admin?]=='true' || session[:sso]["account_#{@hotink_account_id}_manager"]=='true')
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