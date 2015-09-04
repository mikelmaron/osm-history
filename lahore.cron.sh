cd /opt/osm-history-new/osm-history; 
#rake import:osmtm_tags mapathon-awconfig.yml;
rake import:nodeways lahore-awconfig.yml;
rake import:users lahore-awconfig.yml;
rake questions:changesets lahore-awconfig.yml; 
rake questions:users lahore-awconfig.yml;
rake questions:multi_users lahore-awconfig.yml;
rake questions:ways lahore-awconfig.yml

/opt/osmdown/buildLahore.sh
