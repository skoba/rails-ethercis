Ethercis = YAML.load(
  File.read("#{Rails.root}/config/ethercis.yml"))[Rails.env]
