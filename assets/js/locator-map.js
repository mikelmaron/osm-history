---
---
var map = L.map('map').setView([51.505, -0.09], 13);
        L.tileLayer('https://{s}.tiles.mapbox.com/v3/{id}/{z}/{x}/{y}.png', {
            maxZoom: 18,
            attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
        '<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
        'Imagery © <a href="http://mapbox.com">Mapbox</a>',
            id: 'examples.map-i875mjb7'
        }).addTo(map);

d3.json("{{site.baseurl}}/json/bbox_geojson_geometry.json", function(error, data) {
	L.geoJson(data).addTo(map);
	var bounds = L.geoJson(data).getBounds();
	map.fitBounds(bounds);
});

var geojsonLayer;
