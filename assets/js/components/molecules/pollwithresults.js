import React from "react";
/*
Displays whole database and individual polls
*/
class PollWithResults extends React.Component {
  render(){
    return (
      <div>
        <h4> { this.props.poll.poll_id } </h4>
        <input type="button" value={ this.props.poll.title } id="show_button" />
      </div>
    );
  }
}
export default PollWithResults;
