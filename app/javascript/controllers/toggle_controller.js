import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log("Hello from toggle_controller.js")
  }
}
