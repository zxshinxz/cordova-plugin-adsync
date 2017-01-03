
/*global cordova, module*/

module.exports = {
  showAdsyncListTest: function (title, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "Adsync", "showAdsyncListTest", [title]);
  },
  showAdsyncList: function (title, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "Adsync", "showAdsyncList", [title]);
  },
  showAdsyncListWeb: function (title, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "Adsync", "showAdsyncListWeb", [title]);
  },
  showAdsyncListWebTest: function (title, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "Adsync", "showAdsyncListWebTest", [title]);
  },
  destroy: function (successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "Adsync", "destroy", []);
  },
  getUsername: function (userName, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "Adsync", "getUsername", [userName]);
  },
  getUserPoint: function (userPoint, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "Adsync", "getUserPoint", [userPoint]);
  },
  getUserPointTest: function (userPoint, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "Adsync", "getUserPointTest", [userPoint]);
  },
  init: function (successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "Adsync", "init", []);
  },
  setAge: function (age, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "Adsync", "setAge", [age]);
  },
  setDebug: function (isDebug, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "Adsync", "setDebug", [isDebug]);
  },
  setGender: function (gender, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "Adsync", "setGender", [gender]);
  },
  setMarket: function (market, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "Adsync", "setMarket", [market]);
  },
  setUserId: function (userId, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "Adsync", "setUserId", [userId]);
  },
  withdrawUserPoint: function (description, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "Adsync", "withdrawUserPoint", [description]);
  },
  withdrawUserPointTest: function (description, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, "Adsync", "withdrawUserPointTest", [description]);
  }

};
