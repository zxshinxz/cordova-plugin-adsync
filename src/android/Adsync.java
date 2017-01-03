package kr.co.applicat;

import android.content.Context;
import android.content.Intent;
import android.util.Log;

import com.fpang.lib.FpangSession;
import com.fpang.lib.SessionCallback;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

public class Adsync extends CordovaPlugin {

    private static final String TAG = "kr.co.applicat.Adsync";

    @Override
    public boolean execute(String action, JSONArray data, final CallbackContext callbackContext) throws JSONException {

        if (action.equals("showAdsyncListTest")) {
            Log.d(TAG, "index=showAdsyncListTest");

            String title = data.getString(0);
            FpangSession.showAdsyncListTest(this.cordova.getActivity(), title);

            callbackContext.success("Done");

            return true;
        } else if (action.equals("showAdsyncList")) {
            Log.d(TAG, "index=showAdsyncList");

            String title = data.getString(0);
            if (title == null)
                FpangSession.showAdsyncList(this.cordova.getActivity());
            else
                FpangSession.showAdsyncList(this.cordova.getActivity(), title);

            callbackContext.success("Done");

            return true;
        } else if (action.equals("showAdsyncListWeb")) {
            Log.d(TAG, "index=showAdsyncListWeb");

            String title = data.getString(0);
            FpangSession.showAdsyncListWeb(this.cordova.getActivity(), title);

            callbackContext.success("Done");

            return true;
        } else if (action.equals("showAdsyncListWebTest")) {
            Log.d(TAG, "index=showAdsyncListWeb");

            String title = data.getString(0);
            FpangSession.showAdsyncListWebTest(this.cordova.getActivity(), title);

            callbackContext.success("Done");

            return true;
        } else if (action.equals("destroy")) {
            Log.d(TAG, "index=destroy");

            FpangSession.destroy();

            callbackContext.success("Done");

            return true;
        } else if (action.equals("getUsername")) {
            Log.d(TAG, "index=getUsername");

            String userName = FpangSession.getUsername();

            callbackContext.success(userName);

            return true;
        } else if (action.equals("getUserPoint")) {
            Log.d(TAG, "index=getUserPoint");

            FpangSession.getUserPoint(this.cordova.getActivity(), new SessionCallback() {
                @Override
                public void onResult(Context ctx, Object result) {
                    callbackContext.success(result.toString());
                }
            });

            return true;
        } else if (action.equals("getUserPointTest")) {
            Log.d(TAG, "index=getUserPointTest");

            FpangSession.getUserPointTest(this.cordova.getActivity(), new SessionCallback() {
                @Override
                public void onResult(Context ctx, Object result) {
                    callbackContext.success(result.toString());
                }
            });

            return true;
        } else if (action.equals("init")) {
            Log.d(TAG, "index=init");

            FpangSession.init(this.cordova.getActivity());

            callbackContext.success("Done");

            return true;
        } else if (action.equals("setAge")) {
            Log.d(TAG, "index=setAge");

            String age = data.getString(0);
            FpangSession.setAge(age);

            callbackContext.success("Done");

            return true;
        } else if (action.equals("setDebug")) {
            Log.d(TAG, "index=setDebug");

            boolean isDebug = data.getBoolean(0);
            FpangSession.setDebug(isDebug);

            callbackContext.success("Done");

            return true;
        } else if (action.equals("setGender")) {
            Log.d(TAG, "index=setGender");

            String gender = data.getString(0);
            FpangSession.setGender(gender);

            callbackContext.success("Done");

            return true;
        } else if (action.equals("setMarket")) {
            Log.d(TAG, "index=setMarket");

            String market = data.getString(0);
            FpangSession.setMarket(market);

            callbackContext.success("Done");

            return true;
        } else if (action.equals("setUserId")) {
            Log.d(TAG, "index=setUserId");

            String userId = data.getString(0);
            FpangSession.setUserId(userId);

            callbackContext.success("Done");

            return true;
        } else if (action.equals("withdrawUserPoint")) {
            Log.d(TAG, "index=withdrawUserPoint");

            String description = data.getString(0);
            FpangSession.withdrawUserPoint(this.cordova.getActivity(), new SessionCallback() {
                @Override
                public void onResult(Context ctx, Object result) {
                    callbackContext.success(result.toString());
                }
            }, description);


            return true;
        } else if (action.equals("withdrawUserPointTest")) {
            Log.d(TAG, "index=withdrawUserPointTest");

            String description = data.getString(0);
            FpangSession.withdrawUserPointTest(this.cordova.getActivity(), new SessionCallback() {
                @Override
                public void onResult(Context ctx, Object result) {
                    callbackContext.success(result.toString());
                }
            }, description);

            return true;
        } else {
            return false;
        }
    }
}
