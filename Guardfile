group 'js' do
  guard 'rails-assets' do
    watch(%r{^app/assets/javascripts/(.*)\.(js|coffee)$})
  end

  spec_location = "spec/javascripts/%s_spec"

  guard 'jasmine-headless-webkit' do
    watch(%r{^app/views/.*\.jst$})
    watch(%r{^public/javascripts/(.*)\.js$}) { |m| newest_js_file(spec_location % m[1]) }
    watch(%r{^app/assets/javascripts/(.*)\.(js|coffee)$}) { |m| newest_js_file(spec_location % m[1]) }
    watch(%r{^spec/javascripts/(.*)_spec\..*}) { |m| newest_js_file(spec_location % m[1]) }
  end
end
