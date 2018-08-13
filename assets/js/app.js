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
import Form from './components/molecules/form';
import Display from './components/molecules/display';

class App extends React.Component {
  render() {
    return (<Form />);
  }
}

ReactDOM.render(
  <App/>,
  document.getElementById("root")
)

class Show extends React.Component {
  render() {
    return(<Display />);
  }
}

ReactDOM.render(
  <Show/>,
  document.getElementById("polldisplay")
)
// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

import { Poll } from "./poll"
let poll = new Poll()
