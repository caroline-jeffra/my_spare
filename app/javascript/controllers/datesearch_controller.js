import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = ['calendar']

  connect() {
    this.instance = flatpickr(this.calendarTarget, {
      minDate: "today"
    })
  }

  toggle() {
    if(this.calendarTarget.classList.contains("isOpen")) {
      this.instance.close()
      this.calendarTarget.classList.remove("isOpen")
    } else {
      this.instance.open()
      this.calendarTarget.classList.add("isOpen")
    }
  }

  clear() {
    this.instance.clear()
  }
}

