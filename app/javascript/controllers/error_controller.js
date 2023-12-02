import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "message" ]

  remove() {
    if (this.hasMessageTarget) {
      this.messageTarget.remove()
    }
  }
}
