Pry.config.color = true
Pry.config.history.should_save = true

if defined?(Rails) && Rails.env
  extend Rails::ConsoleMethods
end
