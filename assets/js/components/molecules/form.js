import React from "react";
import Question from '../atoms/question';
import Choice from '../atoms/choice';
import { createPoll } from "../../api/twocents_api";
/*
Form for user to add new poll to the database
*/
class Form extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      // String for poll question
      question: '',
      // Array for choices, default 2 choices
      choices:["",""]
    };
    // While user is typing in question
    this.handleQuestionChange = this.handleQuestionChange.bind(this);
    // While user is typing in choices
    this.handleChoiceChange = this.handleChoiceChange.bind(this);
    // When user presses Submit button
    this.handleSubmit = this.handleSubmit.bind(this);
    // When user clicks Add Choices button
    this.addChoices = this.addChoices.bind(this);
  }
  // While user is typing in question
  handleQuestionChange(event) {
    // copies text in input box
    const value = event.target.value;
    console.log("handleQuestionChange");
    // edits question to text in input box
    this.setState((prevState) => {
      let question = prevState.question;
      // sets text in input box to question
      question = value;
      return {
        question: question
      };
    });
  }
  // While user is typing in choices
  handleChoiceChange(event) {
    // copies text in input box
    const value = event.target.value;
    // each input box assigned an index for differentiation
    const idx = event.target.name;
    console.log("handleChoiceChange");
    // edits choices array via index to text in input box
    this.setState((prevState) => {
      const choices = [...prevState.choices];
      // sets text in input box to choice array via same index
      choices[idx] = value;
      return {
        choices: choices
      };
    });
  }
  // When user presses Submit button
  handleSubmit(event){
    // does not allow default to be submitted as a new poll
    event.preventDefault();
    console.log("calling createPoll");
    // Formats question and choices appropriately for html POST request
    createPoll(this.state.question, this.state.choices);
    alert("Poll has been submitted!");
  }
  // When user clicks Add Choices button
  addChoices(){
    // If maximum number of choices is not reached
    if(Object.keys(this.state.choices).length < 4){
      // Add new input box to choices
      this.setState({
        choices: [ ...this.state.choices, "" ]
      });
    }
  }

  render(){
    const handleQuestionChange = this.handleQuestionChange;
    const handleChoiceChange = this.handleChoiceChange;
    const question = this.state.question;
    const choices = this.state.choices;
    return(
      <form>
        <div class="newpoll">
          <h3> SUBMIT NEW POLL </h3>
        </div>
        <div id="form">
        <input type="submit" value="SUBMIT" onClick={this.handleSubmit} />
        <label>Question</label>
        <Question
          handleQuestionChange={handleQuestionChange}
          value={question} />
        <input type="button" value="ADD CHOICES" id="more_choices" disabled={this.state.choices.length >= 4} onClick={this.addChoices} />
        <div id="defaultchoices">
          <label>Choices</label>
          {this.state.choices.map(function(choice, idx) {
            return <Choice
              handleChoiceChange={handleChoiceChange}
              key={idx}
              name={idx}
              value={choices[idx]}
            />;
          })}
        </div>
        </div>
      </form>
    );
  }
}

export default Form;
