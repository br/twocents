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

const getOnePoll = (id) => {
  return fetch(`http://0.0.0.0:4000/test/polls/${id}`, {
    method: "GET",
    headers: {
      "Content-Type": "application/json"
    }
  }).then((res) => res.json());
}


const getAllPolls = () => {
  return fetch("http://0.0.0.0:4000/test/polls", {
    method: "GET",
    headers: {
      "Content-Type": "application/json"
    }
  }).then((res) => res.json());
}

export { createPoll, getAllPolls, getOnePoll };
