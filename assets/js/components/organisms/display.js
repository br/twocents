import React from "react";
import { getAllPolls, getOnePoll } from "../../api/twocents_api";
import PollWithResults from "../molecules/pollwithresults";
/*
Displays whole database and individual polls
*/
class Display extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      polls: null
    };
    this.getPolls = this.getPolls.bind(this);
  }

  componentDidMount(){
    this.getPolls();
  }

  // pollComponent(){
  //  // Display database in uniform format
  //
  // }
  //

  async getPolls() {
    var res = await getAllPolls();
    this.setState({ polls: res.data })
    console.log(res.data);
  }

  render(){
    var polls = this.state.polls || [];
    return (
      <div>
        <h3> SHOW ALL POLLS </h3>
        <p>------DATABASE------</p>
        { polls.map(function(poll) {
          return ( <PollWithResults key={`poll-${poll.poll_id}`} poll={poll}/> )
        }) }
      </div>
    );
  }
}
export default Display;
