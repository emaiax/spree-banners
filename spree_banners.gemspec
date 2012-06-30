# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_banners'
  s.version     = '1.0.0'
  s.summary     = 'Extension to manage banners for your Spree Shop'
  s.required_ruby_version = '>= 1.9.2'

  s.author   = 'Eduardo Maia'
  s.email    = 'eduvimaia@gmail.com'
  s.homepage = 'https://github.com/emaiax/spree-banners.git'

  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*', 'db/**/*', 'config/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core'
  s.add_dependency 'spree_auth'
  s.add_dependency 'paperclip', '>= 2.5.0'
end
