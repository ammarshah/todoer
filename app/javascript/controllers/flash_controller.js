import { Controller } from "@hotwired/stimulus"
import Toastify from "toastify-js"

export default class extends Controller {
  static targets = [ "flash" ]

  connect() {
    if (this.hasFlashTarget) {
      this.showFlash()
    }
  }

  showFlash() {
    for(let flash of this.flashTargets) {
      const message = flash.textContent
      const type = flash.dataset.type

      this.#showToast(message, type)
    }
  }

  #showToast(message, type) {
    let options = {
      text:      message,
      className: type,
      gravity:   "top",
      position:  "center",
      duration:  8000,
      close:     true
    }

    if (type === "alert") {
      options.duration = -1 // Permanent toast
      options.close    = false
    }

    Toastify(options).showToast()
  }
}
