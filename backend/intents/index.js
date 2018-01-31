const apiai = require('apiai')(process.env.APIAI_CLIENT_TOKEN);
const uuidv4 = require('uuid/v4');

// This is where we call out to DialogFlow (API.ai) with our text to get an
// intent.
const callApiAi = (text, sessionId) => new Promise((resolve, reject) => {
  const request = apiai.textRequest(text, {sessionId: sessionId});

  request.on('response', response => resolve(response));
  request.on('error', error => reject(error));
  request.end()
})

// This is where we decide what we do with the response we get from API.ai.
const doIntent = (response) => {
  const {parameters, action, fulfillment } = response.result;

  return new Promise((resolve, reject) => {
    // TODO(you!): Decide what you want to do with the given action and
    // parameters, the world is your oyster!
    return reject(handleUnknownAnswer());
  });
};

const handleUnknownAnswer = (err) => {
  const msgs = [
    'Didn\'t quite catch what you said?',
    'Can you try again?',
    'Sorry, can\'t help you with that?'
  ];

  return msgs[~~(Math.random() * msgs.length)];
};

const processRequest = (msg) => new Promise((resolve, reject) => {
  try {
    const input = JSON.parse(msg);

    if (input.type === 'user' && input.msg) {
      const sessionId = input.sessionId || uuidv4();

      callApiAi(input.msg, sessionId)
      .then(response => doIntent(response))
      .then(answer => resolve(answer))
      .catch(err => resolve(handleUnknownAnswer(err)));
    }
  } catch (erro) {
    resolve(handleUnknownAnswer(err));
  }
});

module.exports = processRequest;
