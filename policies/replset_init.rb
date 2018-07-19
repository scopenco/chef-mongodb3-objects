instance_eval IO.read(File.expand_path('../Policyfile_base', __FILE__))
name 'replset_init'
run_list 'mongotest::test_replset_init'