const zeroFill = (num, width) => {
  width -= num.toString().length;

  if (width > 0) {
    return new Array(width + (/\./.test(num) ? 2 : 1)).join('0') + num;
  } else {
    return num.toString();
  }
}

export default zeroFill;
