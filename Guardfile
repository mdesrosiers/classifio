group 'js' do
  guard 'rails-assets' do
    watch(%r{^app/assets/javascripts/(.*)\.(js|coffee)$})
  end

  guard 'jasmine-headless-webkit' do
    watch(%r{^public/assets/.*\.js$})
    watch(%r{^spec/javascripts/.*\.coffee$})
  end
end
