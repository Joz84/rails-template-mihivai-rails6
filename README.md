# Rails Templates

Quickly generate a rails app with the default [MihiVai](https://www.mihivai.com) configuration
using [Rails Templates](http://guides.rubyonrails.org/rails_application_templates.html).

## minimal

```bash
rails new \
  --database postgresql \
  --webpack \
  -m https://raw.githubusercontent.com/ClaudineP435433/rails-template-mihivai-rails6/master/minimal.rb \
  CHANGE_THIS_TO_YOUR_RAILS_APP_NAME
```

To create an app in rails 6,
```
rails _6_ new \
  --database postgresql \
  --webpack \
  -m https://raw.githubusercontent.com/ClaudineP435433/rails-template-mihivai-rails6/master/minimal.rb \
  CHANGE_THIS_TO_YOUR_RAILS_APP_NAME
```


Get a rails 5.2+ app ready to be deployed on Heroku with ths following improvements :
- Bootstrap 4,
- Simple form,
- Gems (font-awesome, erd, env,...) ,
- Public pages updates : 500, 404 and 422 updated with logo.png
- HTML Head including : Google Analytics, Google Structured Data, Metadata/Title/Description
- Standard NavBard and Footer
- Devise install with a generated `User` model.
- Cookies banner
- Git init, add and comit


## Complete

```
rails new \
  --database postgresql \
  --webpack \
  -m https://raw.githubusercontent.com/ClaudineP435433/rails-template-mihivai-rails6/master/complete.rb \
  CHANGE_THIS_TO_YOUR_RAILS_APP_NAME
```
- Active Admin
- Postmark
- Email interceptor
