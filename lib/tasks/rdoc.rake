require 'rdoc/task'

Rake::RDocTask.new do |rdoc|
	rdoc.rdoc_files.include('README')
	rdoc.rdoc_files.include('app/*/*.rb')
	rdoc.main = "README" #page to start on
	rdoc.title = "Software Methods Project: The Facebook"
	rdoc.rdoc_dir = 'rdoc' #where the documentation will be placed
end