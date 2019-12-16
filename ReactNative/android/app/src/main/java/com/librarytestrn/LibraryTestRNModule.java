package com.librarytestrn;


import android.app.Activity;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class LibraryTestRNModule  extends ReactContextBaseJavaModule {

    private static ReactApplicationContext reactContext;

    LibraryTestRNModule(ReactApplicationContext context) {
        super(context);
        reactContext = context;
    }

    @Override
    public String getName() {
        return "LibraryTestRNModule";
    }

    @ReactMethod
    public void FirstAction() {
        MainActivity origin = (MainActivity) this.getCurrentActivity();
        origin.showUnity();
    }

    @ReactMethod
    public void SecondAction() {

    }

}