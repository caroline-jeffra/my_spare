import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = ['calendar']

  connect() {
    flatpickr(this.calendarTarget, {
      minDate: "today"
    })
  }

  toggle() {
    if(this.calendarTarget.classList.contains("isOpen")) {
      flatpickr(this.calendarTarget, {
        minDate: "today"
      }).close()
      this.calendarTarget.classList.remove("isOpen")
    } else {
      flatpickr(this.calendarTarget, {
        minDate: "today"
      }).open()
      this.calendarTarget.classList.add("isOpen")
    }
  }

  clear() {
    flatpickr(this.calendarTarget, {
      minDate: "today"
    }).clear()
  }
}

