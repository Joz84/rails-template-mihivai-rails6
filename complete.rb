def add_gems
  <<-RUBY
  source 'https://rubygems.org'
  ruby '#{RUBY_VERSION}'

  #{"gem 'bootsnap', require: false" if Rails.version >= "5.2"}
  gem 'devise'
  gem 'jbuilder', '~> 2.0'
  gem 'pg', '~> 1.1'
  gem 'puma'
  gem 'rails', '#{Rails.version}'
  gem 'redis'
  gem "execjs", '~> 2.7.0'
  gem 'postmark-rails'
  gem 'activeadmin'
  gem 'activeadmin_addons'
  gem 'draper'
  gem 'pundit'

  gem 'autoprefixer-rails'
  gem 'font-awesome-sass', '~> 5.6.1'
  gem 'sassc-rails'
  gem 'simple_form'
  gem 'uglifier'
  gem 'webpacker'
  gem 'slim'

  group :development do
    gem 'rails-erd'
    gem 'web-console', '>= 3.3.0'
  end

  group :development, :test do
    gem 'pry-byebug'
    gem 'pry-rails'
    gem 'letter_opener'
    gem 'listen', '~> 3.0.5'
    gem 'spring'
    gem 'spring-watcher-listen', '~> 2.0.0'
    gem 'dotenv-rails'
  end
  RUBY
end

def add_letter_opener
  <<-RUBY
  LetterOpener.configure do |config|
    # To overrider the location for message storage.
    # Default value is `tmp/letter_opener`
    config.location = Rails.root.join('tmp', 'emails')

    # To render only the message body, without any metadata or extra containers or styling.
    # config.message_template = :light
    # Default value is `:default` that renders styled message with showing useful metadata.
  end
  RUBY
end

def add_layout
<<-HTML
<!DOCTYPE html>
<html>
  <head>
    <%= render "layouts/google_analytics" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title><%= meta_title %></title>
    <meta name="description" content="<%= meta_description %>">
    <!-- Facebook Open Graph data -->
    <meta property="og:title" content="<%= meta_title %>" />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="<%= request.original_url %>" />
    <meta property="og:image" content="<%= meta_image %>" />
    <meta property="og:description" content="<%= meta_description %>" />
    <meta property="og:site_name" content="<%= meta_title %>" />

    <%= yield(:robots) %>
    <%= csrf_meta_tags %>
    <%= action_cable_meta_tag %>
    <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%#= stylesheet_pack_tag 'application', media: 'all' %> <!-- Uncomment if you import CSS in app/javascript/packs/application.js -->
    #{"    <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload', defer: true %>\n" if Rails.version < "6"}
    <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload', defer: true %>
    <!-- 	prevent Chrome animation on loading -->
    <script type="text/javascript"> </script>
  </head>
  <body>
    <%= render "layouts/cookies_banner" %>
    <%= render 'shared/navbar' %>
    <%= render 'shared/flashes' %>
    <%= yield %>
    <%= render 'shared/footer' %>

    <script type="application/ld+json">
      {
        "@context": "http://schema.org",
        "@type": "Organization",
        "name": "yourdomain",
        "url": "https://www.yourdomain.com/",
        "logo": "",
        "contactPoint": [{
          "@type": "ContactPoint",
          "url": "https://www.yourdomain.com",
          "email": "contact@yourdomain.com",
          "telephone": "+33-30000000",
          "contactType": "customer service"
        }],
        "image": "",
        "description": ""
      }
    </script>
  </body>
</html>
HTML
end

def add_pages_home
<<-HTML
<%= content_for :meta_title, "Yourdomain - Your Meta" %>

<div class="container page-min-height">
  <h1>Pages#Home</h1>
  <p>Find me in app/views/pages/home.html.erb</p>
</div>
HTML
end

def add_pages_legal
<<-HTML
<% content_for(:robots) do %>
  <meta name="robots" content='noindex, nofollow'>
<% end %>

<div class="container page-min-height">
  <h1>Pages#Legal</h1>
  <p>Find me in app/views/pages/legal.html.erb</p>
  <div>
    À tout moment, l’Utilisateur peut faire le choix d’exprimer et de modifier ses souhaits en matière de Cookies. <a href=<%=ENV["DOMAIN_PROD"]%>><%=ENV["DOMAIN_PROD"]%>/</a> pourra en outre faire appel aux services de prestataires externes pour l’aider à recueillir et traiter les informations décrites dans cette section.</p>
    	      À tout moment, l’Utilisateur peut faire le choix d’exprimer et de modifier ses souhaits en matière de Cookies en cliquant sur le lien ci-dessous. <a href=<%=ENV["DOMAIN_PROD"]%>><%=ENV["DOMAIN_PROD"]%></a> pourra en outre faire appel aux services de prestataires externes pour l’aider à recueillir et traiter les informations décrites dans cette section.</p>
    <div class="d-flex justify-content-center mb-4">
      <div class="btn btn-cookie font-size-16px py-2" data-toggle="modal" data-target="#cookiesModal">PERSONNALISER LES COOKIES</div>
    </div>
  </div>
</div>
HTML
end

def update_error_with_controller
  <<-HTML
  <div class="container text-center page-min-height py-5">
      <h1>
        Page d'erreur
      </h1>
      <p>
        Une erreur est survenue. <br> Veuillez nous excuser pour la gêne occasionée.
      </p>
       <p>
        N'hésitez pas à retourner sur la page précédente et à réessayer.
      </p>
      <p>
        <a class="link_mail_to" href="mailto:contact@mihivai.com">Reporter le probléme</a>
      </p>
    </div>
    <div class="container">
      <a class="button-green" href="/">Retour sur le site</a>
    </div>
  HTML
end

def update_error_page(var)
<<-HTML
<!DOCTYPE html>
<html>
<head>
  <title> Yourdomain - Erreur</title>
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <meta charset="UTF-8">
  <style>
    body {
        background-color: white;
        color: #2E2F30;
        text-align: center;
        font-family: "Montserrat", sans-serif;
        margin: 20px;
      }

      .banner-logo img {
        max-width: 90%;
      }

      .container {
        margin: 40px auto;
      }
      h1 {
        font-size: 32px;
        margin: 0px;
      }
      p {
        font-size: 20px;
      }
      .link_mail_to {
        text-decoration: none;
        color: #2e2f30ad;
      }
      .link_mail_to:hover {
        text-decoration: none;
        color: #2E2F30;
      }
      .button-green {
        border-radius: 2px;
        margin: 20px 0px;
        text-decoration: none;
        padding: 10px 41px;
        color: white;
        background-color: #888485;
        font-weight: lighter;
      }
     .button-green:hover {
        text-decoration: none;
        background-color: #a7a4a5;
      }
    </style>
  </head>

  <body class="rails-default-error-page">
    <!-- This file lives in public/500.html -->
      <div class="banner-logo">
        <img src="logo.png" alt="logo">
      </div>
      <div class="container">
        <h1>
          Page d'erreur
        </h1>
        <p>
          Une erreur est survenue. <br> Veuillez nous excuser pour la gêne occasionée.
        </p>
         <p>
          N'hésitez pas à retourner sur la page précédente et à réessayer.
        </p>
        <p>
          <a class="link_mail_to" href="mailto:contact@mihivai.com">Reporter le probléme</a>
        </p>
      </div>
      <div class="container">
        <a class="button-green" href="/">Retour sur le site</a>
      </div>

  </body>
</html>
HTML
end

def add_navbar
<<-HTML
<div class="navbar-mihivai">
  <!-- Logo -->
  <a href="/" class="navbar-mihivai-brand">
    <%= image_tag "logo.png" %>
  </a>

  <div class="d-none d-md-block">
    <div class="d-flex align-items-center justify-content-between">
      <%= link_to "Notre Activité", "#", class: "navbar-mihivai-item navbar-mihivai-link" %>
      <%= link_to "Nos Services", "/", class: "navbar-mihivai-item navbar-mihivai-link" %>
      <%= link_to "Contact", "/", class: "navbar-mihivai-item navbar-mihivai-link" %>
      <% if user_signed_in? %>
        <%= link_to t(".sign_out", default: "Log out"), destroy_user_session_path, method: :delete , class: "navbar-mihivai-item navbar-mihivai-link"%>
      <% else %>
        <%= link_to t(".sign_in", default: "Login"), new_user_session_path , class: "navbar-mihivai-item navbar-mihivai-link"%>
      <% end %>
    </div>
  </div>

  <div class="d-block d-md-none">
    <div class="navbar-dropdown">
      <input id="toggle" type="checkbox"/>
      <label class="hamburger" for="toggle">
        <div class="top"></div>
        <div class="meat"></div>
        <div class="bottom"></div>
      </label>

      <div class="nav">
        <div class="nav-wrapper">
          <nav class= "d-flex flex-column">
            <%= link_to "Accueil", root_path, class: "navbar-link" %>
            <% if user_signed_in? %>
              <%= link_to "Se Déconnecter", destroy_user_session_path, class: "navbar-link", method: :delete %>
            <% else %>
              <%= link_to "Créer un Compte", new_user_registration_path, class: "navbar-link" %>
              <%= link_to "Se Connecter", new_user_session_path,  class: "navbar-link" %>
            <% end %>
          </nav>
        </div>
      </div>
    </div>

  </div>
</div>

<div style="height: 70px;"></div>

HTML
end


def add_footer
<<-HTML
<div class="footer d-flex justify-content-between align-items-center">
  <div class="footer-links">
  </div>
  <div class="footer-copyright d-flex flex-column">
    © 2018 <%=ENV["DOMAIN"] || "localhost:3000"%>
    <%= link_to legal_path do %>
      Mentions légales
    <% end %>
    <%= link_to "https://www.mihivai.com/", target: "_blank" do %>
      Site réalisé par Mihivai
    <% end %>
  </div>
</div>
HTML
end

def add_flash
<<-HTML
<% if notice %>
  <div class="alert alert-info alert-dismissible fade show m-1" role="alert">
    <%= notice %>
    <button type="button" class="close" data-bs-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
<% end %>
<% if alert %>
  <div class="alert alert-warning alert-dismissible fade show m-1" role="alert">
    <%= alert %>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
<% end %>
HTML
end

def add_google_analytics
<<-HTML
<% if Rails.env == "production"  %>
  <!-- Global site tag (gtag.js) - Google Analytics -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=<%= ENV['GOOGLE_ANALYTICS_KEY'] %>"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', "<%= ENV['GOOGLE_ANALYTICS_KEY'] %>");
  </script>
<% end %>
HTML
end

def add_email_interceptor_initializer
<<-RUBY
# if Rails.env.production? || Rails.env.staging?
if Rails.env.staging?
  require "email_interceptor"
  ActionMailer::Base.register_interceptor(EmailInterceptor)
end
RUBY
end

def add_email_interceptor_class
<<-CODE
class EmailInterceptor
  def self.delivering_email(message)
    message.subject = message.to + " " + message.subject
    message.to = [ ENV['DEFAULT_EMAIL'] ]
  end
end
CODE
end

def add_postmark_initializer
<<-RUBY
ActionMailer::Base.smtp_settings = {
  :address => 'smtp.postmarkapp.com',
  :port => 587,
  :domain => ENV['DOMAIN'] || "localhost:3000",
  :user_name => ENV['POSTMARK_USERNAME'],
  :password => ENV['POSTMARK_PASSWORD'],
  :authentication => :plain,
  :enable_starttls_auto => true
}
RUBY
end

def add_postmark_production_environment
  <<-RUBY
\n  config.action_mailer.delivery_method     = :postmark
  config.action_mailer.postmark_settings   = { api_token: ENV['POSTMARK_API_TOKEN'] }
  config.action_mailer.default_url_options = { host: ENV['DOMAIN'] }
  config.action_mailer.raise_delivery_errors = false
  RUBY
end

def add_fr_locales
<<-YAML
fr:
  time:
    formats:
      long: "%d/%m/%Y %H:%M"
YAML
end
def add_en_locales
<<-YAML
en:
  time:
    formats:
      long: "%d/%m/%Y %H:%M"
YAML
end
def add_staging_environment
<<-RUBY
Rails.application.configure do
  config.action_mailer.default_url_options = { host: ENV['DOMAIN'] }
  config.action_mailer.raise_delivery_errors = false
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Ensures that a master key has been made available in either ENV["RAILS_MASTER_KEY"]
  # or in config/master.key. This key is used to decrypt credentials (and other encrypted files).
  # config.require_master_key = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress CSS using a preprocessor.
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.action_controller.asset_host = 'http://assets.example.com'

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Mount Action Cable outside main process or domain.
  # config.action_cable.mount_path = nil
  # config.action_cable.url = 'wss://example.com/cable'
  # config.action_cable.allowed_request_origins = [ 'http://example.com', /http:\/\/example.*/ ]

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  config.force_ssl = true

  # Use the lowest log level to ensure availability of diagnostic information
  # when problems arise.
  config.log_level = :debug

  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Use a real queuing backend for Active Job (and separate queues per environment).
  # config.active_job.queue_adapter     = :resque
  # config.active_job.queue_name_prefix = "drive_a2pconcept_production"

  config.action_mailer.perform_caching = false

  #{add_postmark_production_environment}
  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Use a different logger for distributed setups.
  # require 'syslog/logger'
  # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new 'app-name')

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Inserts middleware to perform automatic connection switching.
  # The `database_selector` hash is used to pass options to the DatabaseSelector
  # middleware. The `delay` is used to determine how long to wait after a write
  # to send a subsequent read to the primary.
  #
  # The `database_resolver` class is used by the middleware to determine which
  # database is appropriate to use based on the time delay.
  #
  # The `database_resolver_context` class is used by the middleware to set
  # timestamps for the last write to the primary. The resolver uses the context
  # class timestamps to determine how long to wait before reading from the
  # replica.
  #
  # By default Rails will store a last write timestamp in the session. The
  # DatabaseSelector middleware is designed as such you can define your own
  # strategy for connection switching and pass that into the middleware through
  # these configuration options.
  # config.active_record.database_selector = { delay: 2.seconds }
  # config.active_record.database_resolver = ActiveRecord::Middleware::DatabaseSelector::Resolver
  # config.active_record.database_resolver_context = ActiveRecord::Middleware::DatabaseSelector::Resolver::Session
end
RUBY
end
def add_active_admin_method
<<-RUBY
  def authenticate_admin!
    redirect_to new_user_session_path unless current_user && current_user.admin
  end
RUBY
end
def add_errors_controller
  <<-RUBY
   class ErrorsController < ApplicationController
      skip_before_action :authenticate_user!
      def not_found
        render status: 404
      end

      def internal_server_error
        render status: 500
      end
    end
  RUBY
end
def add_seed
<<-RUBY
User.create!(email: 'admin@example.com', password: 'azerty', password_confirmation: 'azerty', admin: true)
RUBY
end
run "if uname | grep -q 'Darwin'; then pgrep spring | xargs kill -9; fi"

# GEMFILE
########################################
run 'rm Gemfile'
file 'Gemfile',
  add_gems

# Procfile
########################################
file 'Procfile', <<-YAML
web: bundle exec puma -C config/puma.rb
YAML

# Assets
########################################
run 'rm -rf app/assets/stylesheets'
run 'rm -rf vendor'

file 'app/assets/stylesheets/layouts/_index.scss', <<-CSS
// Import your layouts CSS files here.
// Examples:
// @import "dashboard";
// @import "profile";
// @import "map";
CSS

file 'app/assets/stylesheets/components/_alert.scss', <<-CSS
/* -------------------------------------
 * Your CSS code for flash notices and alerts
* ------------------------------------- */
.alert {
  position: fixed;
  bottom: 16px;
  right: 16px;
  z-index: 1000;
}

.alert-info {
  background: #32B796;
}
.alert-warning {
  background: #EE5F5B;
}
CSS

run 'curl -L https://raw.githubusercontent.com/ClaudineP435433/rails-template-mihivai-rails6/master/banner-mihivai.scss > app/assets/stylesheets/components/_banner.scss'
run 'curl -L https://raw.githubusercontent.com/ClaudineP435433/rails-template-mihivai-rails6/master/footer-mihivai.scss > app/assets/stylesheets/components/_footer.scss'
run 'curl -L https://raw.githubusercontent.com/ClaudineP435433/rails-template-mihivai-rails6/master/input-mihivai.scss > app/assets/stylesheets/components/_input.scss'
run 'curl -L https://raw.githubusercontent.com/ClaudineP435433/rails-template-mihivai-rails6/master/navbar-mihivai.scss > app/assets/stylesheets/components/_navbar.scss'

file 'app/assets/stylesheets/components/_utilities.scss', <<-CSS
.font-montserrat {
  font-family: "Montserrat", sans-serif;
}
.max-width-650px {
  max-width: 650px;
}
.page-min-height {
  min-height: calc(100vh - 170px)
}
.font-size-12px {
  font-size: 12px;
}
.font-size-16px {
  font-size: 16px;
}
.text-cookie {
  color: $cookie;
  &:hover{
    text-decoration: none;
    color: darken($cookie, 35%);
  }
}
.border-cookie {
  border-color: $cookie;
}
CSS

file 'app/assets/stylesheets/components/_index.scss', <<-CSS
@import "alert";
@import 'banner';
@import 'footer';
@import 'navbar';
@import 'utilities';
@import 'input';
CSS

file 'app/assets/stylesheets/config/_fonts.scss', <<-CSS
// Import Google fonts
@import url("https://fonts.googleapis.com/css?family=Open+Sans:400,300,700|Raleway:400,100,300,700,500");
@import url('https://fonts.googleapis.com/css?family=Montserrat:400,,500,600&display=swap');

$fonts: 12px 14px 18px 20px;

@each $font in $fonts {
  .font-size-#{$font} {
    font-size: $font;
  }
}

CSS

file 'app/assets/stylesheets/config/_bootstrap_variables.scss', <<-CSS
$spacer: 1rem !default;
$spacers: (
  0: 0,
  1: ($spacer * .25),
  2: ($spacer * .5),
  3: $spacer,
  4: ($spacer * 1.5),
  5: ($spacer * 3)
)
CSS

file 'app/assets/stylesheets/units/_button.scss', <<-CSS
.btn {
  cursor: pointer;
}
.btn.btn-rounded {
  border-radius: 20px;
}
.btn-cookie {
  color: $primary;
  background-color: $cookie;
  padding: 0.375rem 0.75rem;
  line-height: 1.5;
  font-weight: 600;
  border-radius: 8px;
  border: 1px solid transparent;
  transition: all 0.15s ease-in-out;
  &:hover {
    color: white;
    text-decoration: none;
    background-color: darken($cookie, 35%);
  }
}
CSS
file 'app/assets/stylesheets/units/_index.scss', <<-CSS
@import "button";
CSS

file 'app/assets/stylesheets/application.scss', <<-JS
// Graphical variables
@import "config/fonts";
@import "config/colors";
@import "config/bootstrap_variables";

// External libraries
@import "bootstrap/scss/bootstrap";
// @import "font-awesome-sprockets";
// @import "font-awesome";

// Your CSS partials
@import "layouts/index";
@import "components/index";
@import "units/index";
//@import "pages/index";
JS

if Rails.version < "6"
  run 'rm app/assets/javascripts/application.js'
  file 'app/assets/javascripts/application.js', <<-JS
//= require rails-ujs
//= require_tree .
  JS
end

# Cookies
########################################
run 'curl -L https://raw.githubusercontent.com/ClaudineP435433/rails-template-mihivai-rails6/master/check.svg > app/assets/images/check.svg'
run 'mkdir -p app/javascript/components'
run 'curl -L https://raw.githubusercontent.com/ClaudineP435433/rails-template-mihivai-rails6/master/cookie-mihivai.js > app/javascript/components/cookies.js'
run 'curl -L https://raw.githubusercontent.com/ClaudineP435433/rails-template-mihivai-rails6/master/cookie-mihivai.html.erb > app/views/layouts/_cookies_banner.html.erb'

# Dev environment
########################################
gsub_file('config/environments/development.rb', /config\.assets\.debug.*/, 'config.assets.debug = false')

file 'config/environments/staging.rb',
  add_staging_environment

inject_into_file 'config/environments/production.rb', after: 'config.action_mailer.perform_caching = false' do
  add_postmark_production_environment
end

file 'config/initializers/email_interceptor.rb',
  add_email_interceptor_initializer

file 'config/initializers/letter_opener.rb',
  add_letter_opener

file 'config/initializers/smtp.rb',
  add_postmark_initializer

file 'config/locales/fr.yml',
  add_fr_locales
run 'rm config/locales/en.yml'
file 'config/locales/en.yml',
  add_en_locales

# Layout
########################################
file 'app/views/layouts/_google_analytics.html.erb',
  add_google_analytics

run 'rm app/views/layouts/application.html.erb'
file 'app/views/layouts/application.html.erb',
  add_layout

file 'app/views/shared/_footer.html.erb',
  add_footer


run 'rm public/500.html'
file 'public/500.html',
  update_error_page(500)

run 'rm public/404.html'
file 'public/404.html',
  update_error_page(404)

run 'rm public/422.html'
file 'public/422.html',
  update_error_page(422)


file 'app/views/shared/_navbar.html.erb',
  add_navbar

file 'app/views/shared/_flashes.html.erb',
  add_flash

# run 'curl -L https://github.com/lewagon/awesome-navbars/raw/master/templates/_navbar_wagon.html.erb > app/views/shared/_navbar.html.erb'
# run 'curl -L https://raw.githubusercontent.com/lewagon/rails-templates/master/logo.png > app/assets/images/logo.png'

run 'curl -L https://raw.githubusercontent.com/ClaudineP435433/rails-template-mihivai-rails6/master/logo.png > app/assets/images/logo.png'
run 'curl -L https://raw.githubusercontent.com/ClaudineP435433/rails-template-mihivai-rails6/master/logo.png > public/logo.png'


# README
########################################
markdown_file_content = <<-MARKDOWN
Rails app generated with MihiVai template.
MARKDOWN
file 'README.md', markdown_file_content, force: true

# Generators
########################################
generators = <<-RUBY
  config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework  :test_unit, fixture: false
    end
    config.exceptions_app = self.routes
RUBY

environment generators

########################################
# AFTER BUNDLE
########################################
after_bundle do
  # Debug: Spring process need to be stopped to run rails g simple_form:install
  run 'bin/spring stop'
  # Generators: db + simple form + pages controller
  ########################################
  generate('simple_form:install', '--bootstrap')
  generate(:controller, 'pages', 'home', 'legal', '--skip-routes','--no-test-framework')
  generate('devise:install')
  generate('devise', 'User')
  rails_command 'db:drop db:create db:migrate'
  generate('migration', 'AddAdminToUsers admin:boolean')
  generate("active_admin:install")
  generate("activeadmin_addons:install")
  generate("draper:install")
  generate("pundit:install")
  append_file 'config/initializers/active_admin.rb', add_active_admin_method
  gsub_file('config/initializers/active_admin.rb', 'config.authentication_method = :authenticate_admin_user!', 'config.authentication_method = :authenticate_admin!')
  gsub_file('config/initializers/active_admin.rb', 'config.current_user_method = :current_admin_user', 'config.current_user_method = :current_user')
  rails_command 'db:drop db:create db:migrate'

  #Seed
  run 'rm db/seeds.rb'
  file 'db/seeds.rb', add_seed
  # Routes
  ########################################
  route "root to: 'pages#home'"
  route "get '/legal', to: 'pages#legal', as: 'legal'"

  # Git ignore
  ########################################
  append_file '.gitignore', <<-TXT

# Ignore .env file containing credentials.
.env*

# Ignore Mac and Linux file system files
*.swp
.DS_Store
.bundle
log/*.log
tmp/**/*
tmp/*
!log/.keep
!tmp/.keep
public/assets
public/packs
public/packs-test
node_modules
yarn-error.log
.byebug_history
TXT

  # Devise install + user
  ########################################
  # generate('devise:install')
  # generate('devise', 'User')

  # App controller
  ########################################
  run 'rm app/controllers/application_controller.rb'
  file 'app/controllers/application_controller.rb', <<-RUBY
class ApplicationController < ActionController::Base
#{"  protect_from_forgery with: :exception\n" if Rails.version < "5.2"}  before_action :authenticate_user!

  # uncomment to raise error if authorize is not call in controller
  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def user_not_authorized
    flash[:alert] = "Vous n'êtes pas autorisés à réaliser cette action."
    redirect_to(root_path)
  end

end
RUBY

  # migrate + devise views
  ########################################
  rails_command 'db:migrate'
  generate('devise:views')

  # Pages Controller
  ########################################
  run 'rm app/controllers/pages_controller.rb'
  file 'app/controllers/pages_controller.rb', <<-RUBY
    class PagesController < ApplicationController
      skip_before_action :authenticate_user!, only: [:home, :legal]

      def home
      end

      def legal
      end
    end
  RUBY

run 'rm app/views/pages/legal.html.erb'
file 'app/views/pages/legal.html.erb',
  add_pages_legal

run 'rm app/views/pages/home.html.erb'
file 'app/views/pages/home.html.erb',
  add_pages_home

# Creation des Meta
  ########################################

file 'config/meta.yml', <<-YAML
meta_product_name: "Product Name"
meta_title: "Product name - Product tagline"
meta_description: "Relevant description"
meta_image: "logo.png" # should exist in `app/assets/images/`
YAML

file 'config/initializers/default_meta.rb', <<-RUBY
DEFAULT_META = YAML.load_file(Rails.root.join("config/meta.yml"))
RUBY

# run 'rm app/helpers/application_helper.rb'
# file 'app/helpers/application_helper.rb', <<-RUBY
# module ApplicationHelper
#   def svg_tag(name)
#     file_path = "#{Rails.root}/app/assets/images/#{name}.svg"
#     if File.exists?(file_path)
#       File.read(file_path).html_safe
#     else
#       '(not found)'
#     end
#   end
# end
# RUBY

file 'app/helpers/meta_tags_helper.rb', <<-RUBY
module MetaTagsHelper
  def meta_title
    content_for?(:meta_title) ? content_for(:meta_title) : DEFAULT_META["meta_title"]
  end

  def meta_description
    content_for?(:meta_description) ? content_for(:meta_description) : DEFAULT_META["meta_description"]
  end

  def meta_image
    meta_image = (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META["meta_image"])
    # little twist to make it work equally with an asset or a url
    meta_image.starts_with?("http") ? meta_image : image_url(meta_image)
  end

  # def meta_keywords
  #   content_for?(:meta_keywords) ? content_for(:meta_keywords) : DEFAULT_META["meta_keywords"]
  # end
end
RUBY
# Add rake task for seed
run 'mkdir db/seeds'
file 'lib/tasks/custom_seed.rake', <<-RUBY
namespace :db do
  namespace :seed do
    Dir[Rails.root.join('db', 'seeds', '*.rb')].each do |filename|
      task_name = File.basename(filename, '.rb')
      desc "Seed " + task_name + ", based on the file with the same name in `db/seeds/*.rb`"
      task task_name.to_sym => :environment do
        load(filename) if File.exist?(filename)
      end
    end
  end
end
RUBY


  # Environments
  ########################################
  environment 'config.action_mailer.default_url_options = { host: "http://localhost:3000" }', env: 'development'
  environment 'config.action_mailer.delivery_method = :letter_opener', env: 'development'
  environment 'config.action_mailer.perform_deliveries = true', env: 'development'

  environment 'config.action_mailer.default_url_options = { host: "ENV["DOMAIN"] }', env: 'production'
  file 'lib/email_interceptor.rb',
    add_email_interceptor_class

  # Webpacker / Yarn
  ########################################
  run 'rm app/javascript/packs/application.js'
  run 'yarn add @popperjs/core jquery bootstrap'
  file 'app/javascript/packs/application.js', <<-JS
// External imports
import "bootstrap";

// Internal imports
import { initCookieBanner } from '../components/cookies'

document.addEventListener('turbolinks:load', () => {
  initCookieBanner();
  // Call your functions here, e.g:
  // initSelect2();
});
  JS

  if Rails.version >= "6"
    prepend_file 'app/javascript/packs/application.js', <<-JS
require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

var Turbolinks = require("turbolinks")
Turbolinks.start()

    JS
  end

  inject_into_file 'config/webpack/environment.js', before: 'module.exports' do
  <<-JS
const webpack = require('webpack')

// Preventing Babel from transpiling NodeModules packages
environment.loaders.delete('nodeModules');

// Bootstrap 4 has a dependency over jQuery & Popper.js:
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)

JS
  end
  run "rails webpacker:install:stimulus"
  # error_with-controller
  file('app/controllers/errors_controller.rb',  add_errors_controller)
  file('app/views/errors/not_found.html.erb',   update_error_with_controller)
  file('app/views/errors/internal_server_error.html.erb',   update_error_with_controller)
  route "match '/404', to: 'errors#not_found', via: :all"
  route "match '/500', to: 'errors#internal_server_error', via: :all"

  # Mailer devise FR

  ["confirmation_instructions", "email_changed", "password_change", "reset_password_instructions", "unlock_instructions"].each do |mailer_name|
    run "rm app/views/devise/mailer/#{mailer_name}.html.erb"
    run "curl -L https://raw.githubusercontent.com/ClaudineP435433/rails-template-mihivai-rails6/master/mailer/#{mailer_name}.html.erb > app/views/devise/mailer/#{mailer_name}.html.erb"
  end
  run "curl -L https://raw.githubusercontent.com/ClaudineP435433/rails-template-mihivai-rails6/master/colors.scss > app/assets/stylesheets/config/_colors.scss"
  gsub_file('config/initializers/devise.rb', "config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'", 'config.mailer_sender = ENV["SENDER_EMAIL"]')
  gsub_file('config/initializers/devise.rb', "# config.parent_mailer = 'ActionMailer::Base'", "config.parent_mailer = 'ApplicationMailer'")

  # Dotenv
  ########################################
  run 'touch .env'

  # Rubocop
  ########################################
  # run 'curl -L https://raw.githubusercontent.com/lewagon/rails-templates/master/.rubocop.yml > .rubocop.yml'

  # Git
  ########################################
  git :init
  git add: '.'
  git commit: "-m 'Initial commit with devise template from Mihivai'"

  # Fix puma config
  gsub_file('config/puma.rb', 'pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }', '# pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }')
end
