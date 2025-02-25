import { Controller } from "@hotwired/stimulus"
import {computePosition} from 'https://cdn.jsdelivr.net/npm/@floating-ui/dom@1.6.13/+esm';

// Connects to data-controller="booking-popup.js"
export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!", this.element);
  }

  static targets = ["popup", "button"]

  // open() {
  //   this.popupTarget.style = {
  //         left: 'calc(100vw / 2)',
  //         top: 'calc(100vh / 2)',
  //       }
  //  }
}
