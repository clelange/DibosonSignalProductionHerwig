# DibosonSignalProductionHerwig
Diboson Madgraph signal production with Herwig hadronizer

# GEN-SIM production

LHE files already exist, so we need to run on the EDM LHE files.

## Setup

Create a new directory and clone the repository inside:
```
mkdir signalProduction
cd signalProduction
git clone git@github.com:clelange/DibosonSignalProductionHerwig.git
```

Set up CMSSW and crab:

```
cmsrel CMSSW_7_1_25_patch3
cd CMSSW_7_1_25_patch3/src
cmsenv
source /cvmfs/cms.cern.ch/crab3/crab.sh
for i in `ls ../../DibosonSignalProductionHerwig/GEN-SIM`; do ln -s ../../DibosonSignalProductionHerwig/GEN-SIM/$i; done
```

Submit jobs:
```
./submitCrab.sh
```

Resubmit:
```
./resubmit.sh
```

### side note

To add further signal samples, follow the steps below. To get the `herwigpp` hadronizer fragement:

```
curl  -s https://raw.githubusercontent.com/cms-sw/genproductions/6d430cafd974df5188a4b8c9d33a2747db73e83d/python/ThirteenTeV/Grav_Hadronizer_TuneEE5C_13TeV_madgraph_differentPDF_herwigpp_cff.py --retry 2 --create-dirs -o  Configuration/GenProduction/python/ThirteenTeV/Grav_Hadronizer_TuneEE5C_13TeV_madgraph_differentPDF_herwigpp_cff.py
```

 The `RunIISummer15GS` request e.g. for the 4 TeV signal sample can be found at https://cms-pdmv.cern.ch/mcm/requests?dataset_name=BulkGravToWW_narrow_M-4000_13TeV-madgraph-herwigpp&page=0, copy the commands e.g. from https://cms-pdmv.cern.ch/mcm/public/restapi/requests/get_setup/EXO-RunIISummer15GS-03453.

 Copied from above and slightly adjusted, one can create a config like this:
 ```
 cmsDriver.py Configuration/GenProduction/python/ThirteenTeV/Grav_Hadronizer_TuneEE5C_13TeV_madgraph_differentPDF_herwigpp_cff.py --filein "dbs:/BulkGravToWW_narrow_M-4000_13TeV-madgraph/RunIIWinter15wmLHE-MCRUN2_71_V1-v1/LHE" --fileout file:output.root --mc --eventcontent RAWSIM --customise SLHCUpgradeSimulations/Configuration/postLS1Customs.customisePostLS1,Configuration/DataProcessing/Utils.addMonitoring --datatier GEN-SIM --conditions MCRUN2_71_V1::All --beamspot Realistic50ns13TeVCollision --step GEN,SIM --magField 38T_PostLS1 --python_filename BulkGravToWW_narrow_M-4000_13TeV-madgraph-herwigpp.py --no_exec -n 20 || exit $? ;
 ```

# DIGI-RECO



# MiniAODv2
