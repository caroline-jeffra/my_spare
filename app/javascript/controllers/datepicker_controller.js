import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static values = {
    bookings: Array
  }

  connect() {
    console.log(this.bookingsValue)
    flatpickr(this.element, {
      dateFormat: "Y-m-d",
      disable: this.bookingsValue
    })
  }
}
