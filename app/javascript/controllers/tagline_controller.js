import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "tagline" ]
  taglines = []

  async initialize() {
    this.taglines = await this.fetchTaglines()
  }

  async fetchTaglines() {
    const response = await fetch('/taglines')
    return await response.json()
  }

  changeTagline() {
    const currentTagline = this.taglineTarget.textContent
    const newTagline = this.randomTagline(currentTagline)
    this.taglineTarget.textContent = newTagline
  }

  randomTagline(excludedTagline) {
    let randomTagline

    do {
      const randomIndex = Math.floor(Math.random() * this.taglines.length)
      randomTagline = this.taglines[randomIndex]
    } while (randomTagline === excludedTagline)

    return randomTagline
  }
}
