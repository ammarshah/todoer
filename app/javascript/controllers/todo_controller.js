import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "addTodoForm", "title", "titleHiddenField" ]

  updateTitleHiddenFieldValue() {
    this.titleHiddenFieldTarget.value = this.titleTarget.textContent
  }

  submitForm(event) {
    event.preventDefault()
    
    this.addTodoFormTarget.submit()
    
    this.titleTarget.textContent = ''
    this.titleHiddenFieldTarget.value = ''
  }

  focusOut() {
    this.titleTarget.blur()
  }
}
