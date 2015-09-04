cd /opt/osm-history-new/osm-history; rake import:osmtm_tags nepal-awconfig.yml; rake import:nodeways nepal-awconfig.yml; rake import:users nepal-awconfig.yml; rake questions:changesets nepal-awconfig.yml; 
rake questions:users nepal-awconfig.yml;
#rake questions:multi_users nepal-awconfig.yml;
rake questions:ways nepal-awconfig.yml


