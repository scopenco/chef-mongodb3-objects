instance_eval IO.read(File.expand_path('../Policyfile_base', __FILE__))
name 'cfg_init'
run_list 'mongotest::test_cfg_init'