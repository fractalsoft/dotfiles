Pry.config.color = true
Pry.config.history.should_save = true

if defined?(Rails) && Rails.env

  # Add Rails console helpers (like reload!) to pry
  if defined?(Rails::ConsoleMethods)
    extend Rails::ConsoleMethods
  end

  # r! to reload Rails console
  def r!
    reload!
  end
end
