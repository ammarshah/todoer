// Copied from https://www.hotrails.dev website sources

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static classes = ["active"]

  initialize() {
    this.activate()
  }

  activate() {
    if (window.scrollY >= 40) {
      this.element.classList.add(this.activeClass)
    } else {
      this.element.classList.remove(this.activeClass)
    }
  }
}
