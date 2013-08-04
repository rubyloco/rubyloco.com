desc "Generates the site and runs local server while watching for changes"
task :preview do
  sh "bundle exec middleman server"
end

desc "Opens the preview site in your default browser"
task :open do
  sh "open http://localhost:4567"
end

task(:sleep) { sleep 5 } # cheap hack to wait for middleman to start
task :delayed_open => [:sleep, :open]

desc "Builds the static site"
task :build do
  sh "bundle exec middleman build"
end

desc "Builds and publishes the static site to the configured deployment location"
task :publish do
  sh "bundle exec middleman deploy --build-before"
end
task :deploy => :publish # alias

desc "Generates the site and opens the preview in your default browser"
multitask :default => [:preview, :delayed_open]
