desc "Manually sweep the cache"
task :cache_sweeper do
  FileUtils.rm_rf Dir[File.join(Rails.root, "public", "posts*")]
end
