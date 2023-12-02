module TodoHelper
  def title_attributes
    ("contenteditable=true
      spellcheck=false
      placeholder='#{Tagline::DEFAULT_TAGLINE}'
      data-todo-target=titleField
      data-action='input->todo#updateTitleHiddenField
        focusin->todo#hideCompletedCheckbox
        focusout->todo#showCompletedCheckbox
        focusout->todo#saveTodo
        keydown.enter->todo#blurTitleField
        keydown.shift+enter->todo#blurTitleField
        keydown.ctrl+enter->todo#blurTitleField
        keydown.alt+enter->todo#blurTitleField
        keydown.ctrl+alt+enter->todo#blurTitleField
        keydown.ctrl+shift+enter->todo#blurTitleField
        keydown.shift+alt+enter->todo#blurTitleField
        keydown.ctrl+alt+shift+enter->todo#blurTitleField
        keydown.esc->todo#resetTitle
        paste->todo#squishTitle'"
    ).html_safe
  end

  def todo_was_marked_complete?(old_todo, new_todo)
    !old_todo.completed? && new_todo.completed?
  end

  def todo_was_marked_incomplete?(old_todo, new_todo)
    old_todo.completed? && !new_todo.completed?
  end
end
