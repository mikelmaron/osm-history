---
---
(function(){
	function turf_line_distance(feature) {
		if (feature.geometry.type != "LineString") { return ""; }
		var distance = 0;
		for (var i=0; i < feature.geometry.coordinates.length - 1; i++) {
			distance += turf.distance(
				turf.point( feature.geometry.coordinates[i][0], feature.geometry.coordinates[i][1]), 
				turf.point( feature.geometry.coordinates[i+1][0], feature.geometry.coordinates[i+1][1]), 
				'kilometers');
		}
		return distance.toString() + " km";
		
  }

	d3.json("{{site.baseurl}}/json/user_list.json", function(error, data) {
		d3.select("#users").selectAll("li").data(data).enter().append("li")
			.text(function(d) { return d.user + " "; })
			.on("click", function(d) {

				document.getElementById("user-counts").innerHTML = "<b>" + d.user + "</b> Nodes: " + d.nodes + ", Ways: " + d.ways + ", Relations: " + d.relations + ", Changesets: " + d.changesets;
/*				d3.select("#user-counts").selectAll("span").data(
						[{"label": "Nodes", "count": d.nodes}, 
							{"label": "Ways", "count": d.ways}, 
							{"label": "Relations", "count": d.relations}, 
							{"label": "Changesets", "count": d.changesets}]).enter().append("span").text(function(d) { return d.label + ": " + d.count.toString() + "<br/>"; });
*/
				d3.json('{{site.baseurl}}/json/user_list_with_geometry/' + d.user + '.json', function(error, data) {
					if (typeof geojsonLayer != "undefined") { geojsonLayer.clearLayers(); }

					var myStyle = { "color": "#ff0000" };
					function onEachFeature(feature, layer) {
						//var distance = turf.distance(layers[0].toGeoJSON(), layers[1].toGeoJSON(), 'miles').toFixed(3) + ' miles'
 		      	layer.bindPopup(JSON.stringify(feature.properties, null, 2) + "<br/>" + turf_line_distance(feature));
   			  }
					geojsonLayer = L.geoJson(data, {style: myStyle, onEachFeature: onEachFeature}).addTo(map);
				});
			});
	});
})();
