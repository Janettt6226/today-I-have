import { Controller } from "@hotwired/stimulus"
import { end } from "@popperjs/core";

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ['modal', 'less'];
  connect() {
  }
  open(event) {
    event.preventDefault()
    this.modalTarget.classList.toggle("hide");
    if (this.modalTarget.classList.contains('hide')) {
      this.lessTarget.innerText = "View more";
    } else {
      this.lessTarget.innerText = "View less"
    }
  }
}
