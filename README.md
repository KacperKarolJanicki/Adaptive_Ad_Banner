# adaptive_ad_banner

A simple, lifecycle-safe Flutter package for displaying **adaptive banner ads** from Google AdMob.

This package aims to simplify the implementation of AdMob banners by encapsulating complex 
native resource management (loading, disposing, and adaptive sizing) into a single, 
reusable widget. Stop fighting with `dispose()` and memory leaks!

---

## 🚀 Features

* **Adaptive Sizing:** Automatically determines the optimal, anchors-adaptive banner size based on the device width.
* **Lifecycle Safe:** Handles the native ad lifecycle (`load`, `dispose`) automatically when the widget is created or removed from the widget tree.
* **Simple Implementation:** Requires only your Ad Unit ID to display a working banner.

---

## 🛠️ Installation

### 1. Add to `pubspec.yaml`

Add the package to your project's `pubspec.yaml` file:

```yaml
dependencies:
  adaptive_ad_banner: ^0.0.1 # Use the actual version published on pub.dev
  google_mobile_ads: ^3.0.0 # Make sure you have the official AdMob package as well
```

Run flutter pub get.

### 2. Configure AndroidManifest.xml
   You must add your AdMob Application ID to your android/app/src/main/AndroidManifest.xml file.

Replace "YOUR_ADMOB_APP_ID" with your actual ID (e.g., ca-app-pub-XXXXXXXXXXXXXXXX~XXXXXXXXXX).


``` XML
<application
    android:label="your_app_name"
    android:icon="@mipmap/ic_launcher">
    <meta-data
        android:name="com.google.android.gms.ads.APPLICATION_ID"
        android:value="YOUR_ADMOB_APP_ID"/>

    </application>
```

### 💡 Usage
Use the AdaptiveBannerAdWidget anywhere you need a banner ad. 
The widget will handle loading and correct sizing automatically.

Example Implementation:

``` Dart
import 'package:flutter/material.dart';
import 'package:adaptive_ad_banner/adaptive_ad_banner.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My App')),
      body: const Column( // Użyj const, bo to widżet StatelessWidget
        children: [
          Expanded(
            child: Center(
                child: Text('Główna zawartość aplikacji', style: TextStyle(fontSize: 20))),
          ),
          
          // --- AD BANNER INTEGRATION HERE ---
          // Paste your add unit id here:
          AdaptiveAdBanner(
            adUnitId: 'ca-app-pub-3940256099942544/6300978111', 
          ),
        ],
      ),
    );
  }
}
```
### 🤝 Contributing
We welcome contributions! If you have suggestions or find bugs, please open an issue 
or submit a pull request on the GitHub repository.