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
import MyComponent from "./components/my_component"
import "react-phoenix"
import React from "react"
import ReactDOM from "react-dom"

class Question extends React.Component {
  constructor(props) {
    super(props);
    this.state = {value: ''};

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event){
    this.setState({value: event.target.value});
  }

  handleSubmit(event){
    var title = this.state.value;
    alert('A poll title was submitted: ' + title);
    event.preventDefault();
  }

  render(){
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          Question:
          <input type="text" placeholder="Poll Title" value={this.state.value} onChange={this.handleChange} />
        </label>
        <input type="submit" value="Submit" />
        </form>
    );
  }
}

//=====================
ReactDOM.render(
  <Question />,
  document.getElementById('root')
);

// class HelloReact extends React.Component{
//   render(){
//     return(<h1>Hello React!</h1>);
//   }
// }
//
// ReactDOM.render(
//   <HelloReact/>, document.getElementById("hello-react")
// )


// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

import { Poll } from "./poll"
let poll = new Poll()
