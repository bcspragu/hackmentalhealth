module.exports = {
  'change-attribute-color': (params) => {
    return handleSuccessAnswer(params);
  },
};

const handleSuccessAnswer = (params) => {
  const color = params.color;
  const attr = params['page-attribute'];
  const msgs = [
    `Sure, making it ${color}`,
    'Can do',
    'Consider it done',
    `Making the ${attr} ${color}`,
  ];

  return msgs[~~(Math.random() * msgs.length)];
};
