import React from 'react';

const Choice = (...props) => {
  return <input type="text" name="choice" placeholder="Choice Text"onChange={props.handleChange}/>;
}

export default Choice;
