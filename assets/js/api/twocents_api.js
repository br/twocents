const createPoll = (question, choices) => {

  const formattedChoices = choices.map((choice) => {
    return {
      title: choice
    };
  })

  const payload = {
    "poll":  {
      "title": question,
      "choices": formattedChoices
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
