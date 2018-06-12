instance_eval IO.read(File.expand_path('../base.rb', __FILE__))
name 'replset_init'
run_list 'mongotest::test_replset_init'