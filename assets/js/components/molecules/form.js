import React from "react";
import Choice from '../atoms/choice';

class Form extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      question: '',
      choice:'',
      options: 2
    };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.addChoices = this.addChoices.bind(this);
    this.createChoices = this.createChoices.bind(this);
  }

  handleChange(event) {
    this.setState({[event.target.name]: event.target.value});
  }

  handleSubmit(event){
    var title = this.state.question;
    var choice = this.state.choice;
    alert('A poll was submitted: ' + title + ' with choice ' + choice);
    event.preventDefault();
  }

  addChoices(){
    if(this.state.options < 4){
      this.setState({
        options: this.state.options + 1
      });
    }
  }
  createChoices(optionsLength){
    let optionsArray = [];
    for(var i = 0; i < optionsLength; i++) {
      optionsArray.push(<Choice key={i} handleChange={this.handleChange} />);
    }
    return optionsArray;
  }
  render(){
    const options = this.createChoices(this.state.options);
    return(
      <form onSubmit={this.handleSubmit}>
        <input type="submit" value="Submit" />
        <label>Question</label>
        <input type="text" name="question" placeholder="Poll Title" onChange={this.handleChange}/>
        <label>Choices</label>
        <input type="button" value="Add Choices" id="more_choices" disabled={this.state.options >= 4} onClick={this.addChoices}/>
        <div id="defaultchoices">
          {options}
        </div>
      </form>
    );
  }
}

export default Form;
