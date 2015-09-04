cd /opt/osm-history-new/osm-history; 
#rake import:osmtm_tags mapathon-awconfig.yml;
rake import:nodeways puanytc15-awconfig.yml;
rake import:users puanytc15-awconfig.yml;
rake questions:changesets puanytc15-awconfig.yml; 
rake questions:users puanytc15-awconfig.yml;
rake questions:multi_users puanytc15-awconfig.yml;
rake questions:ways puanytc15-awconfig.yml

/opt/osmdown/buildPuanytc15.sh
