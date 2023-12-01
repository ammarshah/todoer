import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "form", "titleField", "titleHiddenField", "completedHiddenField" ]

  connect() {
    // Retain focus on the title field when Turbo Stream replaces the partial
    if (this.hasTitleFieldTarget) {
      const titleField = this.titleFieldTarget
      const hasFieldClass = titleField.classList.contains('field')
      const hasInvalidClass = titleField.classList.contains('invalid')
  
      if (hasFieldClass || hasInvalidClass) {
        titleField.focus()
      }
    }
  }

  saveTodo(event) {
    event.preventDefault()

    if (this.#hasFormChanged()) {
      this.formTarget.requestSubmit() // requestSubmit() makes form submission request as TURBO_STREAM
    }
  }

  updateCompletedHiddenField() {
    this.#hiddenCompleted = this.#hiddenCompleted === "true" ? "false" : "true"
  }

  updateTitleHiddenField() {
    this.#hiddenTitle = this.#title
  }

  revertTitleChanges() {
    this.#updateTitle(this.#originalTitle)
  }

  blurElement(event) {
    event.currentTarget.blur()
  }

  squishTitle() {
    // Delay the squishing logic to ensure the pasted content is available
    setTimeout(() => {
      // Replace multiple spaces and new lines with a single space
      const squishedTitle = this.#title.replace(/\s+/g, ' ').trim()

      this.#updateTitle(squishedTitle)
    }, 0)
  }

  // Private functions

  get #title() {
    if (this.hasTitleFieldTarget) {
      return this.titleFieldTarget.textContent
    }
  }

  set #title(title) {
    if (this.hasTitleFieldTarget) {
      this.titleFieldTarget.textContent = title
    }
  }

  get #hiddenTitle() {
    if (this.hasTitleHiddenFieldTarget) {
      return this.titleHiddenFieldTarget.value
    }
  }

  set #hiddenTitle(title) {
    if (this.hasTitleHiddenFieldTarget) {
      this.titleHiddenFieldTarget.value = title
    }
  }

  get #originalTitle() {
    if (this.hasTitleHiddenFieldTarget) {
      return this.titleHiddenFieldTarget.dataset.originalValue
    }
  }

  get #hiddenCompleted() {
    if (this.hasCompletedHiddenFieldTarget) {
      return this.completedHiddenFieldTarget.value
    }
  }

  set #hiddenCompleted(completed) {
    if (this.hasCompletedHiddenFieldTarget) {
      this.completedHiddenFieldTarget.value = completed
    }
  }

  get #originalCompleted() {
    if (this.hasCompletedHiddenFieldTarget) {
      return this.completedHiddenFieldTarget.dataset.originalValue
    }
  }

  #hasFormChanged() {
    if (this.#hiddenTitle !== this.#originalTitle || this.#hiddenCompleted !== this.#originalCompleted) {
      return true
    } else {
      return false
    }
  }

  #updateTitle(title) {
    this.#title = title
    this.updateTitleHiddenField()
  }
}
