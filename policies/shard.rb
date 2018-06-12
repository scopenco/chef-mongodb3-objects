instance_eval IO.read(File.expand_path('../base.rb', __FILE__))
name 'shard'
run_list 'mongotest::test_shard'