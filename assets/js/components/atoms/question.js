import React from 'react';

const Question = (props) => {
  return <input
    onChange={props.handleQuestionChange}
    name={props.name}
    placeholder="Question Text"
    type="text"
    value={props.value}
    />;
}

export default Question;

//STILL HAVE TO ADD HANDLEQUESTIONSCHANGE
//AND IMPLEMENT --> CONTINUE ON RYAN'S NOTES
