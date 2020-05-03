require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ywtquest
  class Application < Rails::Application
    # 以下の2行でタイムゾーンを日本に
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    # ネストしたような辞書ファイルを読み込む設定
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s] # フォルダ名、ファイル名は関係ない
    # I18n.enforce_available_locales = false

    config.load_defaults 5.2

    config.generators do |g|
      # 以下の3行で余計なファイルの生成をしない
      g.assets false
      g.helper false
      g.jbuilder false
      
      # Rspecのファイルの生成設定
      g.test_framework :rspec,
        model_specs: true,
        view_specs: false, # viewSpecを作成しない
        helper_specs: false, # helperFile用のspecを作成しない
        routing_specs: false, # routes.rb用のspecを作成しない
        controller_specs: false, # controller用のspecを作成しない
        request_specs: false
    end
  end
end
