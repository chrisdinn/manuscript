module Manuscript
  class SettingsManager < Sinatra::Base
    
    get '/admin/settings' do
      @settings = Settings.new('settings.yml')
      haml :settings
    end
    
    post '/admin/settings' do
      @settings = Settings.new('settings.yml')
      params[:settings].each { |k, v| @settings[k.to_sym] = v }
      @settings.save
      redirect "/admin"
    end
    
  end
end