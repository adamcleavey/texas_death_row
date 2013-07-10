task :import_executions do
  File.open('/Users/levya/Dropbox/Washington\ Post/2013-07-12\ texasDeathRow/rubifiedJSON.json', 'r') do |file|
    file.each do |line|
      attrs = JSON.parse line
      Execution.create! attrs
    end
  end
end