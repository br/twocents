import React from "react";
/*
Displays whole database and individual polls
*/
class PollWithResults extends React.Component {

  render(){
    return (
      <div>
        <h3> { this.props.poll.title } </h3>
      </div>
    );
  }
}
export default PollWithResults;
