@Library('libpipelines') _

hose {
    EMAIL = 'cd'
    GCHAT_TOKENID = 'cd'
    ANCHORE_TEST = true
    SHOW_RAW_YAML = true
    BUILDTOOL_MEMORY_LIMIT = '12Gi'
    BUILDTOOL_MEMORY_REQUEST = '12Gi'
    BUILDTOOL_CPU_REQUEST = '2'
    BUILDTOOL_CPU_LIMIT = '2'
    WORKSPACE_STORAGE_SIZE = '28Gi'
    ITPARAMETERS = """
    | -DZOOKEEPER_HOSTNAME=%%ZOOKEEPER
    | """

    ITSERVICES = [
        ['ZOOKEEPER': [
            'image': 'jplock/zookeeper:3.5.2-alpha',
	    'healthcheck': 2181,
            'env': [
                  'zk_id=1'],
            'sleep': 5]]]
    DEV = { config ->
        doCompile(config)
	parallel(UT: {
        	doUT(config)
            }, IT: {
                doIT(config)
            }, failFast: true)
        doPackage(config)
	doStaticAnalysis(conf: config)
	doDeploy(conf: config)
	doDocker(conf: config)
    }
}
