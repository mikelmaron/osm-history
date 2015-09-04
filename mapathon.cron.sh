cd /opt/osm-history-new/osm-history; 
#rake import:osmtm_tags mapathon-awconfig.yml;
rake import:nodeways mapathon-awconfig.yml; rake import:users mapathon-awconfig.yml; rake questions:changesets mapathon-awconfig.yml; 
rake questions:users mapathon-awconfig.yml;
rake questions:multi_users mapathon-awconfig.yml;
rake questions:ways mapathon-awconfig.yml

/opt/osmdown/buildMapathon.sh
