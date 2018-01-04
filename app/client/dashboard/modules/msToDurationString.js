import zeroFill from './zeroFill';

const msToDurationString = (ms) => {

  const msInHour = 1000 * 60 * 60;
  const msInMinute = 1000 * 60;
  const msInSecond = 1000;

  const hours = parseInt(ms / msInHour);
  if (hours > 0) {
    ms -= hours * msInHour;
  }

  const minutes = parseInt(ms / msInMinute);
  if (minutes > 0) {
    ms -= minutes * msInMinute;
  }

  const seconds = parseInt(ms / msInSecond);

  return hours > 0 ?
    `${hours}:${zeroFill(minutes, 2)}:${zeroFill(seconds, 2)}` : `${minutes}:${zeroFill(seconds, 2)}`;
};

export default msToDurationString;
