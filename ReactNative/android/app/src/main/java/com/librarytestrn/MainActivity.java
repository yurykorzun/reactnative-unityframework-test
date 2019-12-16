package com.librarytestrn;

import android.content.Intent;

import com.facebook.react.ReactActivity;

public class MainActivity extends ReactActivity {


  boolean isUnityLoaded = false;

  /**
   * Returns the name of the main component registered from JavaScript. This is used to schedule
   * rendering of the component.
   */
  @Override
  protected String getMainComponentName() {
    return "LibraryTestRN";
  }

  public void showUnity() {
    isUnityLoaded = true;
    Intent intent = new Intent(this, MainUnityActivity.class);
    intent.setFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT);
    startActivityForResult(intent, 1);
  }

  public void unloadUnity() {
    if(isUnityLoaded) {
      Intent intent = new Intent(this, MainUnityActivity.class);
      intent.setFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT);
      intent.putExtra("doQuit", true);
      startActivity(intent);
      isUnityLoaded = false;
    }
  }

  @Override
  public void onActivityResult(int requestCode, int resultCode, Intent data) {
    super.onActivityResult(requestCode, resultCode, data);

    if(requestCode == 1) isUnityLoaded = false;
  }
}
