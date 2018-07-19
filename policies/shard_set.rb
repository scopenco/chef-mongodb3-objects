instance_eval IO.read(File.expand_path('../Policyfile_base', __FILE__))
name 'shard_set'
run_list 'mongotest::test_shard_set'