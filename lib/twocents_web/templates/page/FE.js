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
