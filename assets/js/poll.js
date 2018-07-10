export class Poll {
  constructor() {
    // Set up the "Add Choice" button on the page
    this._setupAddChoice()
    // And set up the "Remove Choice" buttons on the page
    this._setupRemoveChoice()
  }
  _setupAddChoice() {
    // When add choice is clicked, clone the top choice
    $("#add-choice").on("click", this._cloneChoice)
  }
  _setupRemoveChoice() {
    // When remove choice is clicked, remove the appropriate row
    $("#choices").on("click", "a.remove-choice", this._removeChoice)
  }
  _removeChoice(event) {
    // Find the target, find its parent row, and remove the whole thing
    $(event.currentTarget).parents(".choice").remove()
  }
  _cloneChoice() {
    // Clone the top choice
    let newChoice = $("#choices .choice:first").clone()
    // Reset its value to blank
    newChoice.find("input[type=text]").val("")
    // And then throw it into the choice list
    newChoice.appendTo("#choices")
    // And then focus that text choice
    newChoice.find("input[type=text]").focus()
  }
}
