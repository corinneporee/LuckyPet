import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/rrooddyy/clbc406me000615uonlk4kh6n",
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    this.map.addControl(new MapboxGeocoder({ accessToken: this.apiKeyValue, mapboxgl: mapboxgl }))
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker, index) => {

      const popup = new mapboxgl.Popup().setHTML(marker.info_window)
      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.classList.add(`marker-${index}`)
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "contain"
      customMarker.style.width = "39px"
      customMarker.style.height = "64px"
      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, zoom:8, maxZoom: 20, duration: 0 })
  }
}
