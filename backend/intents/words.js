const validModifier = (modifier) => {
  return modifiers.hasOwnProperty(modifier);
};

const modify = (word, modifier) => {
  return modifiers[modifier](word)
};

const reverse = (s) => {
    return s.split("").reverse().join("");
};

const rot13 = (s) => {
  return (s ? s : this).split('').map(function(_)
    {
      if (!_.match(/[A-Za-z]/)) return _;
      c = Math.floor(_.charCodeAt(0) / 97);
      k = (_.toLowerCase().charCodeAt(0) - 83) % 26 || 26;
      return String.fromCharCode(k + ((c == 0) ? 64 : 96));
    }).join('');
 };

const modifiers = {
  'reverse': reverse,
  'capitalize': (s) => s.toUpperCase(),
  'lowercase': (s) => s.toLowerCase(),
  'rot13': rot13,
};

const handleSuccessAnswer = (word) => {
  const msgs = [
    `Sure, that would be "${word}"`,
    `I think "${word}" is the result`,
  ];

  return msgs[~~(Math.random() * msgs.length)];
};

const handleUnknownModifierAnswer = (modifier) => {
  const msgs = [
    `Sorry, no idea how to ${modifier} a word.`,
    `I don't know what it means to ${modifier} a word.`,
  ];

  return msgs[~~(Math.random() * msgs.length)];
};

module.exports = {
  'modify-word': (params) => {
    if (validModifier(params.modifier)) {
      const out = modify(params.word, params.modifier)
      return handleSuccessAnswer(out);
    } else {
      return handleUnknownModifierAnswer(params.modifier);
    }
  },
};
