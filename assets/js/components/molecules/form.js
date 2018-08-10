import React from "react";
import Choice from '../atoms/choice';
import { createPoll } from "../../api/twocents_api";
/*
Form for user to add new poll to the database
*/
class Form extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      question: '',
      choices:["",""] //Array for choices, default 2 choices
    };
    //While user is typing in question
    this.handleQuestionChange = this.handleQuestionChange.bind(this);
    //While user is typing in choices
    this.handleChoiceChange = this.handleChoiceChange.bind(this);
    //When user presses Submit button
    this.handleSubmit = this.handleSubmit.bind(this);
    //When user clicks Add Choices button
    this.addChoices = this.addChoices.bind(this);
  }
  //While user is typing in question
  handleQuestionChange(event) {
    const value = event.target.value;
    this.setState((prevState) => {
      const question = [...prevState.question];
      question = value;
      return {
        question: question
      };
    });
  }
  //While user is typing in choices
  handleChoiceChange(event) {
    //copies text in input box
    const value = event.target.value;
    //each input box assigned an index for differentiation
    const idx = event.target.name;
    console.log("handleChoiceChange");
    //edits choices array via index to text in input box
    this.setState((prevState) => {
      const choices = [...prevState.choices];
      //sets text in input box to choice array via same index
      choices[idx] = value;
      return {
        choices: choices
      };
    });
  }
  //When user presses Submit button
  handleSubmit(event){
    //does not allow default to be submitted as a new poll
    event.preventDefault();
    console.log("calling createPoll");
    //formats question and choices appropriately for html POST request
    createPoll(this.state.question, this.state.choices);
    debugger;
  }
  //When user clicks Add Choices button
  addChoices(){
    if(Object.keys(this.state.choices).length < 4){ // **** Will need to use Object.keys(this.state.choices).length
      this.setState({
        choices: [ ...this.state.choices, "" ]
      });
    }
  }

  render(){
    const handleChoiceChange = this.handleChoiceChange;
    const choices = this.state.choices;
    return(
      <form>
        <input type="submit" value="Submit" onClick={this.handleSubmit} />
        <label>Question</label>
        <input type="text" name="question" placeholder="Poll Title" />
        <label>Choices</label>
        <input type="button" value="Add Choices" id="more_choices" disabled={this.state.choices.length >= 4} onClick={this.addChoices}/>
        <div id="defaultchoices">
          {this.state.choices.map(function(choice, idx) {
            return <Choice
              handleChoiceChange={handleChoiceChange}
              key={idx}
              name={idx}
              value={choices[idx]}
            />;
          })}
        </div>
      </form>
    );
  }
}

export default Form;
