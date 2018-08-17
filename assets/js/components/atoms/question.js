import React from 'react';

const Question = (props) => {
  console.log(props)
  return <input
    onChange={props.handleQuestionChange}
    name={props.name}
    placeholder="Question Text"
    type="text"
    value={props.value}
  />;
}

export default Question;
