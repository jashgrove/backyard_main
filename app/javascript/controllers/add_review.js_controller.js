import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-review.js"
export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!", this.element);
  }

  static targets = ["reviewsList", ]

  toggleForm() {
    console.log("tada");

  }
}
