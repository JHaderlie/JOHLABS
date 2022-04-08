# EXAMPLE to run:
# sh Documents/ScratchOrgWithDataSetup/orginit.sh  
# sh bin/orginit.sh
# OR
# OrgName="scratchOrg" OrgLife="15" HasDep="false" PermSet="test" sh bin/orginit.sh  
#
# Demo That i watched had this in the bin dir of the project (bin dir was at the main level)    sh bin/orginit.sh
# https://youtu.be/sEEE2dFRPdI?t=1096
#
# $OrgName - Is the org name for the new scrach org to be created
# $OrgNameDef - Is the default scratch org name if not set externally
OrgNameDef="scratch-ecommConnection"
# $OrgLife - Is the duration of the org life
# $OrgLifeDef - Is the default scratch org lifespan, if not set externally
OrgLifeDef="30"
# $HasDep - Is if the org has dependencies (true / false)
# $HasDepDef - Is the default dependancy status of this package if not set externally
HasDepDef="false"
# $PermSet - Permission Set to assign to default user
# $PermSetDef - Is the Default Permission set to define if not set externally
##### PermSetDef="johlabsdx"
# $Data - Data set to load into the org.  options are none,connections,connections and sample
# $DataDef - Default Data to load into the org if not set externally
#####DataDef="connections and sample"
# date time YYYYmmdd.HHMMSS.timezone
datetime=`date +"%Y%m%d.%H%M%S.%Z"`


if [ -z $OrgName ] ; then 
	OrgName=$OrgNameDef
	datetime=`date +"%Y%m%d.%H%M%S.%Z"`
	echo "$datetime - No Org Name was set, setting OrgName to $OrgName"
fi
echo "$datetime - Org Name is $OrgName"

if [ -z $OrgLife ] ; then 
	OrgLife=$OrgLifeDef
	datetime=`date +"%Y%m%d.%H%M%S.%Z"`
	echo "$datetime - No Org Lifespan was set, setting OrgLife to $OrgLife"
fi
datetime=`date +"%Y%m%d.%H%M%S.%Z"`
echo "$datetime - Org Lifespan is $OrgLife days"

sfdx force:org:create -s -f config/project-scratch-def.json -a $OrgName -d $OrgLife

if [ -z $HasDep ] ; then 
	HasDep=$HasDepDef
	datetime=`date +"%Y%m%d.%H%M%S.%Z"`
	echo "$datetime - No Dependancy option was set, setting to $HasDep"
fi
if [ $HasDep == 'true' ] ; then 
	datetime=`date +"%Y%m%d.%H%M%S.%Z"`
	echo "$datetime - This package does have dependencies to install"
	datetime=`date +"%Y%m%d.%H%M%S.%Z"`
	echo "$datetime - Installing Package dependencies now"
#	sfdx texei:package:dependencies:install -r -s AllUsers -u $OrgName
fi
if [ $HasDep == 'false' ] ; then 
	datetime=`date +"%Y%m%d.%H%M%S.%Z"`
	echo "$datetime - This package does not have dependencies to install"
fi
datetime=`date +"%Y%m%d.%H%M%S.%Z"`
echo "$datetime - Pushing Data to New Scratch Org"
#sfdx force:source:push

if [ -z $PermSet ] ; then 
	PermSet=$PermSetDef
	datetime=`date +"%Y%m%d.%H%M%S.%Z"`
	echo "$datetime - No Permission set was defined, setting PermSet to $PermSet"
fi
datetime=`date +"%Y%m%d.%H%M%S.%Z"`
echo "$datetime - Assigning Permission Set $PermSet to user"
#sfdx force:user:permset:assign -n $PermSet

datetime=`date +"%Y%m%d.%H%M%S.%Z"`
#echo "$datetime - Importing Dummy Data File"
#sfdx force:data:tree:import -p ./data/dataimport_sample_01.json

datetime=`date +"%Y%m%d.%H%M%S.%Z"`
echo "$datetime - Opening New org in a browser"
#sfdx force:org:open

datetime=`date +"%Y%m%d.%H%M%S.%Z"`
echo "$datetime - $OrgName is now setup"