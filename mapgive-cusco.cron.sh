cd /opt/osm-history-new/osm-history; 
#rake import:osmtm_tags mapathon-awconfig.yml;
rake import:nodeways mapgive-cusco-awconfig.yml;
rake import:users mapgive-cusco-awconfig.yml;
rake questions:changesets mapgive-cusco-awconfig.yml; 
rake questions:users mapgive-cusco-awconfig.yml;
rake questions:multi_users mapgive-cusco-awconfig.yml;
rake questions:ways mapgive-cusco-awconfig.yml

/opt/osmdown/buildMapGiveCusco.sh
