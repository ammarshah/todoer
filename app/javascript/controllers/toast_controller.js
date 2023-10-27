import { Controller } from "@hotwired/stimulus"
import Toastify from "toastify-js"

export default class extends Controller {
  static targets = [ "message" ]

  connect() {
    if (this.hasMessageTarget) {
      this.showMessage()
    }
  }

  showMessage() {
    const message = this.messageTarget.value

    if (message) {
      const messageType = this.messageTarget.dataset.messageType

      let options = {
        text:      message,
        className: messageType,
        selector:  "flash-messages",
        gravity:   "top",
        position:  "center",
        duration:  8000,
        close:     true
      }

      if (messageType === "alert") {
        options.duration = -1 // Permanent toast
        options.close    = false
      }

      Toastify(options).showToast()
    }
  }
}
