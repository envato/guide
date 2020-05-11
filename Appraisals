%w[
  5.1.4
].each do |rails_version|
  ENV['APPRAISAL_RAILS_VERSION'] = rails_version
  appraise "rails-#{rails_version}" do
    gem 'rails', rails_version
    gem 'rails-controller-testing'
  end
end
