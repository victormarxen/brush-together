import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
  }

  connect() {
    console.log('hello')
  }

  // changeReservation() {
  //   const
  // }

}
