package com.flyclops.testlibrary;

import android.app.Activity;
import android.content.Intent;

import com.librarytestrn.MainActivity;
import com.unity3d.player.UnityPlayer;

public class NativeAndroidPlugin
{
    public static void FirstAction()
    {
        Activity unityActivity = UnityPlayer.currentActivity;
        Intent intent = new Intent(unityActivity, MainActivity.class);
        intent.setFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT | Intent.FLAG_ACTIVITY_SINGLE_TOP);
        unityActivity.startActivity(intent);
    }

    public static void SecondAction()
    {
        
    }
}