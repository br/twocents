const createPoll = (question, choices) => {
  // Need to format choices
  // Choices looks like ["choice1", "choice2"];
  // const formattedChoices = choices.map((choice) => {
  //   return {
  //     title: choice
  //   };
  // })
  const payload = {
    "poll":  {
      "title": question,
      "choices": choices
      /*          ???
      "choices": formattedChoices = choices.map((choice) => {
      return {
        title: choice
    };
    })
      */
    }
  };
  return fetch("http://0.0.0.0:4000/test/polls", {
    body: JSON.stringify(payload),
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    }
  })
};

export { createPoll };
