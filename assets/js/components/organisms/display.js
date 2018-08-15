import React from "react";
import { getAllPolls, getOnePoll } from "../../api/twocents_api";
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
  //  var polls = this.state.polls ? JSON.stringify(this.state.polls, null, 2) : "";
  //
  // }
  //
  // async getPoll() {
  //   var res = await getOnePoll();
  //   this.setState({ })
  // }

  async getPolls() {
    var res = await getAllPolls();
    this.setState({ polls: res })
    console.log(res);
  }

  render(){
    var polls = this.state.polls ? JSON.stringify(this.state.polls, null, 2) : "" ;
    return (
      <div>
        <h3> SHOW ALL POLLS </h3>
        <p>------DATABASE------</p>
        { polls }
      </div>
    );
  }
}
export default Display;
