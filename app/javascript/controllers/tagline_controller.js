import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "tagline" ]
  taglines = []

  async initialize() {
    this.taglines = await this.#fetchTaglines()
  }

  changeTagline() {
    const currentTagline = this.taglineTarget.textContent
    const newTagline = this.#randomTagline(currentTagline)
    this.taglineTarget.textContent = newTagline
  }

  // Private functions

  async #fetchTaglines() {
    const response = await fetch('/taglines')
    return await response.json()
  }

  #randomTagline(excludedTagline) {
    let randomTagline

    do {
      const randomIndex = Math.floor(Math.random() * this.taglines.length)
      randomTagline = this.taglines[randomIndex]
    } while (randomTagline === excludedTagline)

    return randomTagline
  }
}
