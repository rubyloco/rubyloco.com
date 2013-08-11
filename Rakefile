require "middleman-gh-pages"

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

task :deploy => :publish # alias

desc "Generates the site and opens the preview in your default browser"
multitask :default => [:preview, :delayed_open]
