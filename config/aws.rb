 require 'aws'
 # log requests using the default rails logger
 AWS.config(:logger => Rails.logger)
 # load credentials from a file
 if File.exists?(File.dirname(__FILE__)+"/../aws.yml")
    config_path = File.expand_path(File.dirname(__FILE__)+"/../aws.yml")
 else
    config_path = nil
 end
 if config_path
   AWS.config(YAML.load(File.read(config_path)))
 else
    AWS::S3::Base.establish_connection!(
      :access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'] 
    )
 end