import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-form"
export default class extends Controller {
  static targets = ['form']
  connect() {
    console.log("coucou");
    console.log(this.formTarget);
  }

  show(event) {
    event.preventDefault();
    this.formTarget.classList.toggle("hide");
  }
}
