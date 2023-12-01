import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "form", "titleField", "titleHiddenField", "completedCheckbox", "completedHiddenField" ]
  static values = {
    turboFrameId: String
  }

  connect() {
    this.#regainFocus()
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

  hideCompletedCheckbox() {
    this.completedCheckboxTarget.style.opacity = 0
    this.completedCheckboxTarget.style.pointerEvents = "none"
  }

  showCompletedCheckbox() {
    if (!this.#titleHasError()) {
      this.completedCheckboxTarget.style.opacity = 1
      this.completedCheckboxTarget.style.pointerEvents = "auto"
    }
  }

  resetTitle() {
    this.#updateTitle(this.#originalTitle) // Revert title changes
    this.#removeErrorMessage()
    this.titleFieldTarget.blur() // Trigger focusout
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

  #titleIsField() {
    return this.titleFieldTarget.classList.contains("field")
  }

  #titleHasError() {
    return this.titleFieldTarget.classList.contains("invalid")
  }

  #regainFocus() {
    // Regain focus on the title field when Turbo Stream reloads the element
    if (this.hasTitleFieldTarget) {
      if (this.#titleIsField() || this.#titleHasError()) {
        this.titleFieldTarget.focus()
      }
    }
  }

  #removeErrorMessage() {
    const turboFrame = "#" + this.turboFrameIdValue
    const errorMessage = this.element.closest(turboFrame).querySelector('.error-message')

    if (errorMessage) {
      this.titleFieldTarget.classList.remove("invalid")
      errorMessage.remove()
    }
  }
}
