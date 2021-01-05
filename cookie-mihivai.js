function setCookie(name, value, months) {
  var expirationDate = new Date;
  expirationDate.setMonth(expirationDate.getMonth() + months);
  document.cookie = name + "=" + value + ";path=/;expires=" + expirationDate.toGMTString();
}
const cookiesBanner = document.getElementById("cookiesBanner");
const hideCookiesBanner = () => {
  cookiesBanner.classList.add("d-none");
}
const showCookiesBanner = () => {
  cookiesBanner.classList.remove("d-none");
}
document.getElementById("cookiesConsent").addEventListener("click", (e) => {
  setCookie("cookies-consent", "true", 12);
  hideCookiesBanner();
})
if (!(document.cookie.indexOf('cookies-consent=true') > -1)) {
  showCookiesBanner();
}

const gaKey = document.getElementById("accept_google_analytics").dataset.analytics
const cookiesConfigBtn = document.getElementById("cookiesConfigConsent");
var disableStr = 'ga-disable-' + gaKey;
if (document.cookie.indexOf(disableStr + '=true') > -1) {
  window[disableStr] = true;
  document.getElementById("accept_google_analytics").checked = false
}
cookiesConfigBtn.addEventListener("click", (e)=>{
  const googleAnalyticsConsent = document.getElementById("accept_google_analytics");
  setCookie(disableStr, `${!googleAnalyticsConsent.checked}`, 12)
  window[disableStr] = !googleAnalyticsConsent.checked
})
