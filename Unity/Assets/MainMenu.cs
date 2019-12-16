using UnityEngine;
using UnityEngine.UI;
using System.Runtime.InteropServices;

public class MainMenu : MonoBehaviour
{
#if UNITY_IOS && !UNITY_EDITOR
	[DllImport("__Internal")]
	private static extern void _TestLibrary_FirstAction();
    [DllImport("__Internal")]
    private static extern void _TestLibrary_SecondAction();
#endif

    public Button ButtonFirstButton;
    public Button ButtonSecondButton;

    void onFirstButtonPressed()
    {
        Debug.Log("onFirstButtonPressed");
#if UNITY_ANDROID && !UNITY_EDITOR
        using(AndroidJavaClass _nativeAndroidPlugin = new AndroidJavaClass("com.flyclops.testlibrary.NativeAndroidPlugin"))
        {
            _nativeAndroidPlugin.CallStatic("FirstAction");
        }
#elif UNITY_IOS && !UNITY_EDITOR
        _TestLibrary_FirstAction();
#endif
    }

    void onSecondButtonPressed()
    {
        Debug.Log("onSecondButtonPressed");
#if UNITY_ANDROID && !UNITY_EDITOR
        using(AndroidJavaClass _nativeAndroidPlugin = new AndroidJavaClass("com.flyclops.testlibrary.NativeAndroidPlugin"))
        {
            _nativeAndroidPlugin.CallStatic("SecondAction");
        }
#elif UNITY_IOS && !UNITY_EDITOR
        _TestLibrary_SecondAction();
#endif
    }

    // Start is called before the first frame update
    void Start()
    {
        ButtonFirstButton.onClick.AddListener(onFirstButtonPressed);
        ButtonSecondButton.onClick.AddListener(onSecondButtonPressed);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
