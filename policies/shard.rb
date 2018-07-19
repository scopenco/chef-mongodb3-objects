instance_eval IO.read(File.expand_path('../Policyfile_base', __FILE__))
name 'shard'
run_list 'mongotest::test_shard'