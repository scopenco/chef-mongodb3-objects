instance_eval IO.read(File.expand_path('../Policyfile_base', __FILE__))
name 'standalone'
run_list 'mongotest::test_standalone'