<!DOCTYPE html>
	<html>
		<head>
			<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
			<meta charset="utf-8">
			<title>Circles</title>
			<style>
				html, body {
					height: 100%;
					margin: 0;
					padding: 0;
				}
				#map {
					height: 100%;
				}
			</style>
		</head>
		<body>
			<div id="map"></div>
			<script>
				// This example creates circles on the map, representing populations in North America.
				// First, create an object containing LatLng and population for each city.
				var citymap = {
					inmujeres: {
						center: {lat: 19.425993, lng: -99.132211},
						population: 1.5,
						color: '#FF69B4',
						lugar: 'INMujeres, radio de 1.5 KM'
					},
					planetarioIPN: {
						center: {lat:19.496894, lng: -99.139850},
						population: 2,
						color: '#00BFFF',
						lugar: 'Planetario Luis Enrique Erro, radio de 2 KM'
					},
					castilloChapultepec: {
						center: {lat: 19.420440, lng: -99.181934},
						population: 3,
						color: '#FFD700',
						lugar: 'Castillo de Chapultepec, radio de 3 KM'
					},
					estadioAzteca: {
						center: {lat: 19.302859, lng: -99.150525},
						population: 5,
						color: '#9400D3',
						lugar: 'Estadio Azteca, radio de 5 KM'
					}
				}
				
				function initMap() {
					// Create the map.
					var map = new google.maps.Map(document.getElementById('map'), {
						zoom: 16,
						center: {lat: 19.425993, lng: -99.132211},
						mapTypeId: google.maps.MapTypeId.TERRAIN
					});
										
					// Construct the circle for each value in citymap.
					// Note: We scale the area of the circle based on the population.
					for (var city in citymap) {
						// Add the circle for this city to the map.
						var cityCircle = new google.maps.Circle({
							strokeColor: citymap[city].color,
							strokeOpacity: 0.8,
							strokeWeight: 2,
							fillColor: citymap[city].color,
							fillOpacity: 0.40,
							map: map,
							center: citymap[city].center,
							radius: citymap[city].population * 1000
						});
						
						var marker = new google.maps.Marker({
							position: citymap[city].center,
							map: map,
							title: citymap[city].lugar	
						});
					}
				}
			</script>
			<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBrjkEgrx0AtgvPQwg1U6Z4KNKem5MHEMk&callback=initMap"></script>
		</body>
	</html>