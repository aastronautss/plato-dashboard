const capitalize = (word) => {
  if (word.length) {
    return word[0].toUpperCase() + word.slice(1).toLowerCase();
  } else {
    return '';
  }
};

const humanizeSnakeCaseString = (str) => {
  const words = str.split('_');
  words[0] = capitalize(words[0]);

  return words.join(' ');
};

export default humanizeSnakeCaseString;
