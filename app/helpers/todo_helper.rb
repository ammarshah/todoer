module TodoHelper
  def title_attributes
    ("contenteditable=true
      spellcheck=false
      placeholder='#{Tagline::DEFAULT_TAGLINE}'
      data-todo-target=titleField
      data-action='input->todo#updateTitleHiddenField
        focusout->todo#saveTodo
        keydown.enter->todo#saveTodo
        keydown.shift+enter->todo#saveTodo
        keydown.ctrl+enter->todo#saveTodo
        keydown.alt+enter->todo#saveTodo
        keydown.ctrl+alt+enter->todo#saveTodo
        keydown.ctrl+shift+enter->todo#saveTodo
        keydown.shift+alt+enter->todo#saveTodo
        keydown.ctrl+alt+shift+enter->todo#saveTodo
        keydown.esc->todo#revertTitleChanges
        keydown.esc->todo#blurElement
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
