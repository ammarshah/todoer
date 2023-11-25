import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "addTodoForm",
    "updateTodoForm",
    "title",
    "titleHiddenField",
    "completedHiddenField"
  ]

  updateTitleHiddenFieldValue() {
    this.titleHiddenFieldTarget.value = this.titleTarget.textContent
  }

  submitAddTodoForm(event) {
    event.preventDefault()
    
    this.addTodoFormTarget.submit()
    
    this.titleTarget.textContent = ''
    this.titleHiddenFieldTarget.value = ''
  }

  submitUpdateTodoForm() {
    this.#updateCompletedHiddenFieldValue()

    this.updateTodoFormTarget.submit()
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

  #updateCompletedHiddenFieldValue() {
    this.completedHiddenFieldTarget.value = "true"
  }
}
