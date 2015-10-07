begin
  YAML.load(File.read('config/facebook_secrets.yml')).each do |key, value|
    ENV[key] = value
  end
rescue
  raise "You need to add config/facebook_secrets.yml"
end
