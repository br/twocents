const createPoll = (question, choices) => {
  // Arrange choice syntax to acceptable POST request format
  const formattedChoices = choices.map((choice) => {
    return {
      title: choice
    };
  })
  // Arrange poll syntax to acceptable POST request format
  const payload = {
    "poll":  {
      "title": question,
      "choices": formattedChoices
    }
  };
  // Add new poll to database
  return fetch("http://0.0.0.0:4000/test/polls", { //http://two-cents.1bleacherreport.com/test/polls
    body: JSON.stringify(payload),
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    }
  })
};
// View one individual poll
const getOnePoll = (poll_id) => {
  return fetch(`http://0.0.0.0:4000/test/polls/${poll_id}`, {
    method: "GET",
    headers: {
      "Content-Type": "application/json"
    }
  }).then((res) => res.json());
}

// View contents of whole database
const getAllPolls = () => {
  return fetch("http://0.0.0.0:4000/test/polls", {
    method: "GET",
    headers: {
      "Content-Type": "application/json"
    }
  }).then((res) => res.json());
}

export { createPoll, getAllPolls, getOnePoll };
