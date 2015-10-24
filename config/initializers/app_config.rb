if Rails.env.development?
  begin
    YAML.load(File.read('config/facebook_secrets.yml')).each do |key, value|
      ENV[key] = value
    end
  rescue
    raise "You need to add config/facebook_secrets.yml"
  end

  begin
    YAML.load(File.read('config/aws_secrets.yml')).each do |key, value|
      ENV[key] = value
    end
  rescue
    raise "You need to add config/aws_secrets.yml"
  end

  begin
    YAML.load(File.read('config/recaptcha_secrets.yml')).each do |key, value|
      ENV[key] = value
    end
  rescue
    raise "You need to add config/recaptcha_secrets.yml"
  end
end
