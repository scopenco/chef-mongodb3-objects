instance_eval IO.read(File.expand_path('../base.rb', __FILE__))
name 'standalone'
run_list 'mongotest::test_standalone'