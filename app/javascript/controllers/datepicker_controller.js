import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import confirmDatePlugin from "flatpickr/dist/plugins/confirmDate/confirmDate.js"

// Connects to data-controller="datepicker"
export default class extends Controller {
  async connect() {
    flatpickr(this.element, {
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      minDate: "today",
      plugins: [new confirmDatePlugin({ confirmText: "Confirm" })],
    });
  }
}
