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
import Form from './components/molecules/form'; //createPoll
import Display from './components/organisms/display';

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      view: "create"
    };
    this.toggleView = this.toggleView.bind(this);
  }
  // Toggles page between create and display state
  toggleView(){
    this.setState((prevState) => {
      const view = prevState.view === "create" ? "display" : "create";
      return {view};
    })
  }

  render() {
    if (this.state.view === "create") {
      return (<div>
                <Form />              
                <button onClick={this.toggleView}>Toggle</button>
              </div>);
    }
    else if(this.state.view === "display"){
      return (
        <div>
        <Display/>
        <button onClick={this.toggleView}>Toggle</button>
        </div>
      );
    }
    else {
      return false;
    }
  }
}

ReactDOM.render(
  <App/>,
  document.getElementById("root")
)

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

import { Poll } from "./poll"
let poll = new Poll()
