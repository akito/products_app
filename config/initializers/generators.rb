Rails.application.config.generators do |g|
  g.orm :active_record
  g.test_framework :rspec, view_specs: false, routing_specs: false,
                           helper_specs: false, request_specs: false,
                           fixture: true
  g.template_engine :erb
  g.assets false
  g.helper false
end
