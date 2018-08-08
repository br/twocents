// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

import "react-phoenix"
import React from "react"
import ReactDOM from "react-dom"


class HelloWorld extends React.Component {
  render() {
    return (<h1>Hello World!</h1>)
  }
}

class Question extends React.Component {
  constructor(props) {
    super(props);
    this.state = {Qinput: '', OptionInput:''};

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event){
    this.setState({Qinput: event.target.value, OptionInput: event.target.value});
  }

  handleSubmit(event){
    var title = this.state.Qinput;
    alert('A poll title was submitted: ' + title);
    event.preventDefault();
  }

  render(){
    return(
      <form onSubmit={this.handleSubmit}>
        <label>
          Question:
          <input type="text" value={this.state.Qinput} onChange={this.handleChange}/>
          Choices:
          <input type="text" value={this.state.OptionInput} onChange={this.handleChange}/>
          <input type="text" value={this.state.OptionInput} onChange={this.handleChange}/>
        </label>
        <input type="submit" value="Submit" />
      </form>
    );
  }
}

ReactDOM.render(
  <Question/>,
  document.getElementById("hello-world")
)
// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

import { Poll } from "./poll"
let poll = new Poll()
