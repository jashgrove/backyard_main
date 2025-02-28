import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-review.js"
export default class extends Controller {
  connect() {
    // this.element.addEventListener("submit", this.validate.bind(this))
  }

  static targets = ["addReviewForm", "rating"]

  showForm() {
    this.addReviewFormTarget.classList.remove("d-none");
  }

  // validate(event) {
  //   const rating = this.ratingTarget.value
  //   if (rating.trim() === "" || ![1,2,3,4,5].includes(parseInt(rating))) {
  //     event.preventDefault()
  //   }
  // }

  // addReview(event) {
  //   event.preventDefault()

  //   fetch(this.formTarget.action, {
  //     method: "POST",
  //     headers: { "Accept": "application/json" },
  //     body: new FormData(this.formTarget)
  //   })
  //     .then(response => response.json())
  //     .then((data) => {
  //       if (data.inserted_item) {
  //         this.itemsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
  //       }
  //       this.formTarget.outerHTML = data.form
  //     })
  // }
}
