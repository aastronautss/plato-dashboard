function openExternalServiceAuth() {
  var externalServiceWindowEle = document.querySelector('meta[name=external-service-url]');

  if (externalServiceWindowEle) {
    window.open(
      externalServiceWindowEle.content, '_blank',
      'toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=500, height=500'
    );
  }
}

document.addEventListener('DOMContentLoaded', openExternalServiceAuth, false);
