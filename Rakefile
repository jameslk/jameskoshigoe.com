desc 'Deploy website to jameskoshigoe.com'
task :deploy do
	system 'jekyll build'
	system "rsync -avc --exclude-from=.ignorewww --delete -e 'ssh -F .ssh-config' _site/ website:~/www"
end