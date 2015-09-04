cd /opt/osm-history-new/osm-history; 
#rake import:osmtm_tags logging-awconfig.yml;
rake import:nodeways logging-awconfig.yml; rake import:users logging-awconfig.yml; rake questions:changesets logging-awconfig.yml; 
rake questions:users logging-awconfig.yml;
 rake questions:multi_users logging-awconfig.yml;
rake questions:ways logging-awconfig.yml


