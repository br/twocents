import React from "react";
import Choice from '../atoms/choice';
import { createPoll } from "../../api/twocents_api";

class Form extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      question: '',
      choices:["",""]
    };
    this.handleChoiceChange = this.handleChoiceChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.addChoices = this.addChoices.bind(this);
  }

  handleChoiceChange(event) {
    const value = event.target.value;
    const idx = event.target.name;
    console.log("handleChoiceChange");
    this.setState((prevState) => {
      const choices = [...prevState.choices];
      choices[idx] = value;
      return {
        choices: choices
      };
    });
  }

  handleSubmit(event){
    event.preventDefault();
    console.log("calling createPoll");
    createPoll(this.state.question, this.state.choices);
    debugger;
    // var title = this.state.question;
    // var choice = this.state.choice;
    // alert('A poll was submitted: ' + title + ' with choice ' + choice);
  }

  addChoices(){
    if(this.state.choices.length < 4){ // Will need to use Object.keys(this.state.choices).length
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
