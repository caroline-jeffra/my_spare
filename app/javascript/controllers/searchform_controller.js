import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "rangeInput", "rangeText" ]

  connect() {
    this.fire();
  }

  fire() {
    console.log(this.rangeInputTarget.value);
    if(this.rangeInputTarget.value == 100) {
      this.rangeTextTarget.innerHTML = "∞ km"
    } else {
      this.rangeTextTarget.innerHTML = this.rangeInputTarget.value.concat("km")
    }

  }
}

