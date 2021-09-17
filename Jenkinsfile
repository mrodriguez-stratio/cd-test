@Library('libpipelines@master') _

hose {
    EMAIL = 'cd'
    GCHAT_TOKENID = 'cd'
    ANCHORE_TEST = true
    ITPARAMETERS = """
    | -DZOOKEEPER_HOSTNAME=%%ZOOKEEPER
    | """

    ITSERVICES = [
        ['ZOOKEEPER': [
            'image': 'jplock/zookeeper:3.5.2-alpha',
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
