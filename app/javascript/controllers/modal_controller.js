import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ['form'];
  connect() {
    console.log("coucouc");
    console.log(this.formTarget)
  }
  toggle() {
    // this.modalTarget.classList.toggle('show');
    this.formTarget.open();

  }
}
