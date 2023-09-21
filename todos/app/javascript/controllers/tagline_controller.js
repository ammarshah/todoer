import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "tagline" ]
  currentTaglineId = 1 // Initial tagline id will always be 1

  async changeTagline() {
    const response = await fetch(`/taglines/random?exclude_id=${this.currentTaglineId}`)
    const newTagline = await response.json()

    this.currentTaglineId = newTagline.id
    this.taglineTarget.textContent = newTagline.text
  }
}
