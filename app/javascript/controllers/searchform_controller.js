import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "rangeInput", "rangeText" ]

  connect() {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    if(urlParams.get('distance') === null){
      this.rangeInputTarget.value = 100
    }

    this.fire();
  }

  fire() {
    if(this.rangeInputTarget.value == 100) {
      this.rangeTextTarget.innerHTML = "∞ km"
    } else {
      this.rangeTextTarget.innerHTML = this.rangeInputTarget.value.concat(" km")
    }

  }
}

