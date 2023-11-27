import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "form", "title", "titleHiddenField", "completedHiddenField" ]

  updateCompletedHiddenFieldValue() {
    const hiddenField = this.completedHiddenFieldTarget
    hiddenField.value = hiddenField.value === "true" ? "false" : "true"
    this.submitForm()
  }

  updateTitleHiddenFieldValue() {
    this.titleHiddenFieldTarget.value = this.titleTarget.textContent
  }

  submitForm(event) {
    if (event) event.preventDefault()
    this.formTarget.submit()
  }

  focusOut() {
    this.titleTarget.blur()
  }

  autoSquishText() {
    // Delay the squishing logic to ensure the pasted content is available
    setTimeout(() => {
      const sqishedTitle = this.#squishString(this.titleTarget.textContent)

      this.titleTarget.textContent = sqishedTitle
      this.titleHiddenFieldTarget.value = sqishedTitle
    }, 0)
  }

  // Private functions

  #squishString(string) {
    // Replace multiple spaces and new lines with a single space
    return string.replace(/\s+/g, ' ').trim()
  }
}
