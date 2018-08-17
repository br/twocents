import React from 'react';

const Choice = (props) => {
  console.log(props)
  return <input
    onChange={props.handleChoiceChange}
    name={props.name}
    placeholder="Choice Text"
    type="text"
    value={props.value}
  />;
}

export default Choice;
