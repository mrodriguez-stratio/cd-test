@Library('libpipelines') _

hose {
    EMAIL = 'cd'
    ANCHORE_TEST = true
    DEPLOYONPRS = false
    GENERATE_QA_ISSUE = true
    SHOW_RAW_YAML = true
//    ANCHORE_NIGHTLY_JOB = true
    ITPARAMETERS = """
    | -DZOOKEEPER_HOSTNAME=%%ZOOKEEPER
    | """

    ITSERVICES = [
        ['ZOOKEEPER': [
            'image': 'jplock/zookeeper:3.5.2-alpha',
	    'ports': [[containerPort: 2181, port: 2181]],
            'env': [
                  'zk_id=1'],
            'sleep': 60,
	    'volumes': ["/tmp:/tmp", "/tmp2:/tmp2"]
	]]]

	ATSERVICES = [
		['ZOOKEEPER': [
			'image': 'jplock/zookeeper:3.5.2-alpha',
			'env': [
				'zk_id=1',
				'USER=\$REMOTE_USER'],
			'sleep': 5]]]

    DEV = { config ->
        doCompile(config)
        //doUT(config)
        doIT(config)
	/*
	    parallel(UT: {
        	doUT(config)
            }, IT: {
                doIT(config)
            }, failFast: true)
	    */
        doPackage(config)
	doStaticAnalysis(conf: config)
	doDeploy(conf: config)
	//doDockers(conf:config, dockerImages: [[conf: config, image: "cd-test"]])
	doDocker(conf: config)
		    
	//doRenameImages(conf: config)
    }
}
