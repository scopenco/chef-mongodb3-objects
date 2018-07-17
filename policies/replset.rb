instance_eval IO.read(File.expand_path('../base.rb', __FILE__))
name 'replset'
run_list 'mongotest::test_replset'