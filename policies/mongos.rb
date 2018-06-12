instance_eval IO.read(File.expand_path('../base.rb', __FILE__))
name 'mongos'
run_list 'mongotest::test_mongos'