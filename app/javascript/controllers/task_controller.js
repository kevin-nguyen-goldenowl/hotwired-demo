import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ["description", "error"]

  connect() {
    this.descriptionTarget.onInput = (e) => {
      this.errorTarget.innerText = ''
    }
  }

  validate(e) {
    if(!this.descriptionTarget.value) {
      e.preventDefault();
      this.errorTarget.innerText = "Task name can not be blank!"
    }
    else {
      alert(this.descriptionTarget.value)
      this.errorTarget.innerText = ''
    }
  }
}
