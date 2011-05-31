# This file has an underscore prepended to its filname to ensure it's loaded before all other initializers

configatron.configure_from_yaml(Rails.root.join('config', 'config.yml'))

# Wipe out environment settings and apply just the settings from the current environment
configatron.environment = nil
configatron.configure_from_hash YAML.load(File.read(Rails.root.join('config', 'config.yml')))['environment'][Rails.env]

# s3cr3ts
secrets_file = Rails.root.join('config', 'config_secrets.yml')
configatron.configure_from_yaml(secrets_file) if File.exists?(secrets_file)