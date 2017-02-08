from CRABClient.UserUtilities import config, getUsernameFromSiteDB
config = config()

config.General.requestName = 'request_DATASET_DATE'
config.General.workArea = 'crab_projects'
config.General.transferOutputs = True
config.General.transferLogs = False

config.JobType.pluginName = 'Analysis'
config.JobType.psetName = 'configs/CONFIG.py'

config.Data.inputDataset = "/DSBASE/LHE"
config.Data.splitting = 'EventAwareLumiBased'
config.Data.unitsPerJob = EVENTSJOB
config.Data.totalUnits = config.Data.unitsPerJob * NJOBS
config.Data.outLFNDirBase = '/store/user/%s/' % (getUsernameFromSiteDB())
config.Data.publication = True
config.Data.outputDatasetTag = 'DATASET'

config.Site.storageSite = 'T2_CH_CSCS'
config.Site.blacklist = ['T3_US_Baylor']
