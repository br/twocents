class Button extends React.Component {
  render() {
    const Tag = this.props.href ? "a" : "button";
    return <Tag onClick={this.props.onClick}>{this.props.btnText}</Tag>;
  }
}

class HackbrightDemo extends React.Component {
  constructor() {
    super();

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    alert("Hi");
  }

  render() {
    return <div>
      <h1>Hello World</h1>
      <Button onClick={this.handleClick} btnText="Component Button"/>
    </div>;
  }
}

ReactDOM.render(
  <HackbrightDemo />,
  document.getElementById('app')
);
