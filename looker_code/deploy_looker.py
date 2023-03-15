import sys
import os
import looker_sdk
from looker_sdk import models, error

ini_file = 'looker.ini'
project_id = 'demo-project-for-automation' # project name in looker
instance = sys.argv[1] # host name e.g. 'mydomain.looker.com'
release_branch = sys.argv[2] # name of git branch, e.g. 'release-xyz'

#sdk = looker_sdk.init40(ini_file, section=instance)

os.environ['LOOKERSDK_BASE_URL'] = 'https://panderasystems.looker.com/'
os.environ['LOOKERSDK_CLIENT_ID'] = 'Snt7FCwWTf2W6j9M6Vr5'
os.environ['LOOKERSDK_CLIENT_SECRET'] = 'DJzPNgMBXq7WzWMC3Qh7pzhc'
os.environ['verify_ssl']= 'True'

sdk = looker_sdk.init40("looker.ini")

try:
  sdk.deploy_ref_to_production(project_id=project_id, branch=release_branch)
  print('Production mode for {} in {} set to branch: {} \n'.format(project_id, instance, 
  release_branch))
except:
  print('Failed to Update Production mode for {} in {} \n'.format(project_id, instance))
