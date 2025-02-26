import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-review.js"
export default class extends Controller {
  connect() {
  }

  static targets = ["addReviewForm", "form"]

  showForm() {
    this.addReviewFormTarget.classList.remove("d-none");
  }

  addReview(event) {
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.itemsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
        }
        this.formTarget.outerHTML = data.form
      })
  }
}
