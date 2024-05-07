import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["description", "error"];

  connect() {
    this.descriptionTarget.onInput = (e) => {
      this.errorTarget.innerText = "";
    };
  }

  validate(e) {}
}
