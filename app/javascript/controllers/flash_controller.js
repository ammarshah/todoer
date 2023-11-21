import { Controller } from "@hotwired/stimulus"
import Toastify from "toastify-js"

export default class extends Controller {
  static targets = [ "flash" ]

  connect() {
    if (this.hasFlashTarget) {
      this.#showFlash()
    }
  }

  // Private functions

  #showFlash() {
    for(let flash of this.flashTargets) {
      const message = flash.value
      const type = flash.dataset.type

      this.#showToast(message, type)
      flash.remove()
    }
  }

  #showToast(message, type) {
    let options = {
      text:      message,
      className: type,
      gravity:   "top",
      position:  "center",
      duration:  8000,
      close:     true,
      escapeMarkup: false
    }

    if (type === "alert") {
      options.duration = -1 // Permanent toast
      options.close    = false
    }

    Toastify(options).showToast()
  }
}
